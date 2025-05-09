Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414CD2951CB
	for <linux-sunxi@lists.linux.dev>; Fri,  9 May 2025 14:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799968; cv=none; b=l2bcb85he65vFSFIAN8ki/GoAiHHEX1F/f1WXRD6ZhoYzx2IOSWtreG5SBT/AG+HbVzi/ncf7sFZPXgEt3E+t/n+LGz1QpWALNYIo2pLXPEbUv2A/DRFtqFHUODQSAb+XUmz+1d+try2PDA8Me7WLJqjOFKz3r4+MF9oajEzksc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799968; c=relaxed/simple;
	bh=cLsE1ApBIDgSf/XMFV/dYI3/IBao+Xg/VpaCZxwAFSw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OoBGGBL2ed44eCJuLYdLp8RIsc89T7HFgurLeXwfjK4YQ4Er8jEQr5xkKqY8YjC6XEFxLWKTUKowY9+nKhTjmTBBNiGP0TR5Fa0RC3TTlv1wbTyR1bmo4HLBY7HzZom1eXvWM9y+xcN3414AfAKmuP6DxsywQVtHBU72t7Buqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D16D1595;
	Fri,  9 May 2025 07:12:35 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27F593F5A1;
	Fri,  9 May 2025 07:12:44 -0700 (PDT)
Date: Fri, 9 May 2025 15:12:38 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ryan@testtoast.com,
 macromorgan@hotmail.com, p.zabel@pengutronix.de, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, samuel@sholland.org, jernej.skrabec@gmail.com,
 wens@csie.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH V9 01/24] dt-bindings: clock: sun50i-h616-ccu: Add LVDS
 reset
Message-ID: <20250509151238.71d10c26@donnerap.manchester.arm.com>
In-Reply-To: <20250507201943.330111-2-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
	<20250507201943.330111-2-macroalpha82@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 May 2025 15:19:20 -0500
Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the required LVDS reset binding for the LCD TCON.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  include/dt-bindings/reset/sun50i-h616-ccu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/reset/sun50i-h616-ccu.h b/include/dt-bindings/reset/sun50i-h616-ccu.h
> index 81b1eba2a7f7..ba626f7015b5 100644
> --- a/include/dt-bindings/reset/sun50i-h616-ccu.h
> +++ b/include/dt-bindings/reset/sun50i-h616-ccu.h
> @@ -69,5 +69,6 @@
>  #define RST_BUS_GPADC		60
>  #define RST_BUS_TCON_LCD0	61
>  #define RST_BUS_TCON_LCD1	62
> +#define RST_BUS_LVDS		63
>  
>  #endif /* _DT_BINDINGS_RESET_SUN50I_H616_H_ */

