Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A15B10F4
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 21:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D2DC433C8;
	Mon, 28 Aug 2023 21:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693258452;
	bh=qN7pNxG0J5mbeYN5+tZ6fUg7paWZnxUjZeSAaskCCW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nl/386jjeFdIjNmmbkgUC2qkUXrOeNFNYXerAiHYGtJ8kpJmB/a1z8TUak1drhBvx
	 KUao1FLuroE7KSQmcsTd2lbZP0InLi/uZ54R+QGbZV0SvXVTG12E1aFlPZupjW2N3L
	 xum8SUWQ4ItodqShJtRrm+bwMCp+E+xjMtKvZP1IhYhkdUa/9k3PcygH2e4gldzKTG
	 gYyKZjqlrsSYzpBxBblui25sNS2QFNhpSgUt7FakqQkR1HsK3ue4R+LQaxMg6i7R5N
	 6tJT3D3GOF5xE2oBjs4huTr2QzEuHWIOdfWt+7YZErJkQtG7uORVx92Ltqrk4kw3H2
	 gvOYEoHygbFpA==
Received: (nullmailer pid 384190 invoked by uid 1000);
	Mon, 28 Aug 2023 21:34:08 -0000
Date: Mon, 28 Aug 2023 16:34:08 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: samuel@sholland.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, mripard@kernel.org, wens@csie.org, sam@ravnborg.org, airlied@gmail.com, conor+dt@kernel.org, jagan@edgeble.ai, linux-sunxi@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org, uwu@icenowy.me, daniel@ffwll.ch, Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de, Chris Morgan <macromorgan@hotmail.com>, jernej.skrabec@gmail.com, andre.przywara@arm.com, robh+dt@kernel.org, noralf@tronnes.org
Subject: Re: [PATCH V4 4/8] dt-bindings: usb: Add V3s compatible string for
 EHCI
Message-ID: <169325844800.384111.13904652434846250219.robh@kernel.org>
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
 <20230828181941.1609894-5-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828181941.1609894-5-macroalpha82@gmail.com>


On Mon, 28 Aug 2023 13:19:37 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Allwinner V3s uses a generic EHCI and OHCI for USB host
> communication and the MUSB controller for OTG mode. Add compatible
> strings for the EHCI node.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

