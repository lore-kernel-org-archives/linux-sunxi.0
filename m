Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0FC1C11
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Apr 2023 13:25:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DAEF10A;
	Sun, 16 Apr 2023 15:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1681651516;
	bh=K1YyYPxqlo8x0z8CFYuKhkS6h5XnbugyXRD+m3v6t+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYEa6rBvV07FbhTKRy/yVdc+naA/KunzZ6mX4AppiJWXdNntc79/o/GnhdOGqUclj
	 fRx7IrQDMxoOL6R8n5tD17FPAqCmj4jBJ9vAw/NvFmDmyPnZFwVp8b5SQ0hquODq2G
	 32u742q+tNl/je0x1epHRxYwt1Yrbnk0zxGT2NA8=
Date: Sun, 16 Apr 2023 16:25:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org, samuel@sholland.org, jonas@kwiboo.se,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: h3: beelink-x2: Disable DW-HDMI CEC
Message-ID: <20230416132531.GA28551@pendragon.ideasonboard.com>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
 <20230415104613.61224-4-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230415104613.61224-4-jernej.skrabec@gmail.com>

Hi Jernej,

Thank you for the patch.

On Sat, Apr 15, 2023 at 12:46:13PM +0200, Jernej Skrabec wrote:
> Beelink X2 uses software implementation of CEC even though DW-HDMI has
> working hardware implementation.

Why ? The reason should be explained in the commit message.

> Disable unused DW-HDMI CEC.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> index a6d38ecee141..38f40d69e5c5 100644
> --- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> @@ -150,6 +150,7 @@ &emac {
>  };
>  
>  &hdmi {
> +	snps,disable-cec;
>  	status = "okay";
>  };
>  

-- 
Regards,

Laurent Pinchart
