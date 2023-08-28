Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED86111E
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 21:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B98C433C8;
	Mon, 28 Aug 2023 21:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693258422;
	bh=PFfXs8AC7VFN8eHd/c0BTyi5M+ho7s200lbxRDLF7pQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3AOaLriDRXg4VHGUdmWXhf57CjUv7S43GJKHJ34Cav9qcwP8AA/0bonF6fdXiigL
	 WrUjSin0BCQZ954CcPJ26/IuOpM/BSeQjxOPuW1gSjwuDDIIwCHPcYVehwqKdUxuMe
	 BA3JULesg7N5Gnm9MrOTI6cHk3kxMjSXsm897jWkX0Q6q+FIV3azRCqJBvsuuBQ7r+
	 +Qwv4hz+gf1oQOCttDHPlxRi6PQup20zY1Qenkn5RvbDG35fNqREo6Ww4+iPCCXrYM
	 r7SUK/cySQFNPsoHbcQF2k7Exd176QPw2RxcI3+dGGjpvHH/rLxevRG7lwx4YJD8Np
	 rQmECXoVYhNwg==
Received: (nullmailer pid 383048 invoked by uid 1000);
	Mon, 28 Aug 2023 21:33:39 -0000
Date: Mon, 28 Aug 2023 16:33:39 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, airlied@gmail.com, andre.przywara@arm.com, conor+dt@kernel.org, daniel@ffwll.ch, heiko@sntech.de, jagan@edgeble.ai, jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, neil.armstrong@linaro.org, noralf@tronnes.org, sam@ravnborg.org, samuel@sholland.org, uwu@icenowy.me, wens@csie.org, Chris Morgan <macromorgan@hotmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH V4 4/8] dt-bindings: usb: Add V3s compatible string for
 EHCI
Message-ID: <20230828213339.GA380887-robh@kernel.org>
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

On Mon, Aug 28, 2023 at 01:19:37PM -0500, Chris Morgan wrote:
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

Normally, Greg would take this, but neither he nor linux-usb were Cc'ed. 
Please use get_maintainer.pl.

Rob
