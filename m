import { useState } from "react";
import Image from "next/image";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Music, User, Search, PlayCircle, DollarSign, Upload, FileMusic, Lock, Star, TrendingUp, Award, ListMusic, LogIn, Share2, Heart, MessageSquare } from "lucide-react";

export default function NotaLibreUI() {
  const [activeTab, setActiveTab] = useState("inicio");
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLogin = (event) => {
    event.preventDefault();
    setIsLoggedIn(true);
  };

  const handleShare = (platform) => {
    const url = "https://notalibre.com"; 
    let shareUrl = "";

    switch (platform) {
      case "whatsapp":
        shareUrl = `https://wa.me/?text=${encodeURIComponent(url)}`;
        break;
      case "facebook":
        shareUrl = `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(url)}`;
        break;
      case "instagram":
        alert("Instagram no permite compartir enlaces directamente.");
        return;
      case "tiktok":
        alert("TikTok no permite compartir enlaces directamente.");
        return;
      default:
        return;
    }
    window.open(shareUrl, "_blank");
  };

  return (
    <div className="w-full min-h-screen bg-gradient-to-r from-yellow-400 via-red-500 to-pink-500 text-white p-4">
      {!isLoggedIn ? (
        <section className="flex flex-col items-center justify-center h-screen">
          <Card className="p-6 bg-white text-black rounded-lg shadow-md">
            <h2 className="text-xl font-semibold mb-4 text-center">Iniciar Sesión</h2>
            <form onSubmit={handleLogin} className="flex flex-col gap-4">
              <Input type="email" placeholder="Correo electrónico" required />
              <Input type="password" placeholder="Contraseña" required />
              <Button type="submit" className="bg-blue-500 text-white hover:bg-blue-600">
                <LogIn className="mr-2" /> Iniciar Sesión
              </Button>
              <div className="flex flex-col gap-2 mt-4">
                <Button className="bg-red-500 text-white hover:bg-red-600">Iniciar con Google</Button>
                <Button className="bg-blue-700 text-white hover:bg-blue-800">Iniciar con Facebook</Button>
                <Button className="bg-black text-white hover:bg-gray-800">Iniciar con TikTok</Button>
              </div>
            </form>
          </Card>
        </section>
      ) : (
        <>
          <header className="flex justify-between items-center p-4 bg-white text-black rounded-lg shadow-md">
            <h1 className="text-xl font-bold">NotaLibre</h1>
            <nav className="flex gap-4">
              <Button variant="ghost" onClick={() => setActiveTab("inicio")}><Music className="mr-2" /> Inicio </Button>
              <Button variant="ghost" onClick={() => setActiveTab("explorar")}><Search className="mr-2" /> Explorar </Button>
              <Button variant="ghost" onClick={() => setActiveTab("perfil")}><User className="mr-2" /> Perfil </Button>
            </nav>
          </header>
          <main className="mt-6 flex flex-col items-center">
            {activeTab === "inicio" && <h2 className="text-xl font-semibold">Bienvenido a NotaLibre</h2>}
            {activeTab === "explorar" && (
              <div className="p-6 bg-white text-black rounded-lg shadow-md w-full max-w-md">
                <h2 className="text-xl font-semibold mb-4">Descubre Música</h2>
                <Button className="bg-yellow-500 text-white hover:bg-yellow-600">Tendencias</Button>
                <Button className="bg-blue-500 text-white hover:bg-blue-600">Nuevos Lanzamientos</Button>
                <Button className="bg-green-500 text-white hover:bg-green-600">Recomendaciones</Button>
              </div>
            )}
            {activeTab === "perfil" && (
              <div className="p-6 bg-white text-black rounded-lg shadow-md w-full max-w-md">
                <h2 className="text-xl font-semibold mb-4">Perfil del Artista</h2>
                <div className="flex flex-col gap-4">
                  <Input type="text" placeholder="Nombre del artista" />
                  <Textarea placeholder="Biografía" />
                  <Input type="file" />
                  <div className="flex flex-col gap-2">
                    <Input type="url" placeholder="Instagram" />
                    <Input type="url" placeholder="Facebook" />
                    <Input type="url" placeholder="YouTube" />
                    <Input type="url" placeholder="TikTok" />
                  </div>
                </div>
              </div>
            )}
            <div className="p-4 mt-6 bg-white text-black rounded-lg shadow-md w-full max-w-md">
              <h2 className="text-xl font-semibold mb-4">Reproductor</h2>
              <div className="flex justify-between items-center">
                <Button className="bg-blue-500 text-white hover:bg-blue-600 flex items-center">
                  <PlayCircle className="mr-2" /> Reproducir
                </Button>
                <Button className="bg-purple-500 text-white hover:bg-purple-600 flex items-center" onClick={() => handleShare("facebook")}> 
                  <Share2 className="mr-2" /> Compartir
                </Button>
              </div>
              <div className="flex flex-col gap-2 mt-4">
                <Button className="bg-green-500 text-white hover:bg-green-600" onClick={() => handleShare("whatsapp")}>Compartir en WhatsApp</Button>
                <Button className="bg-blue-700 text-white hover:bg-blue-800" onClick={() => handleShare("facebook")}>Compartir en Historias de Facebook</Button>
                <Button className="bg-pink-500 text-white hover:bg-pink-600" onClick={() => handleShare("instagram")}>Compartir en Instagram</Button>
                <Button className="bg-black text-white hover:bg-gray-800" onClick={() => handleShare("tiktok")}>Compartir en TikTok</Button>
              </div>
            </div>
          </main>
        </>
      )}
    </div>
  );
}
