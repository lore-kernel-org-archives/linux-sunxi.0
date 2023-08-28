Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F4915D5
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 21:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36035C433C7;
	Mon, 28 Aug 2023 21:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693258463;
	bh=rdMNwLBUBrqIx10Ynf9DLHyYSuYCdN6wSGRVvQMZ3c0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oh5khnBmAxWFqriaVz6ke1FbDpx4zllrIjrdyROp43yXAlDHkhbbpYZLIuni8oCuo
	 kz0kgNK8fm9QN3oDfGcmxw/AOmybZrezW6WFRnS1oLteM/iN+Abnmtv6KIuItjwyfm
	 6NDfsQlXPyl7ODev08UYujz03/oMEC9rTm8528Tx7602UowqB02lSSRyk7v6c9m1KB
	 yAoECJp0MKprYT8xLdwhPd66rZ2GNv13aYMNPqmq5CkC5GvoWK5MwyPSH6p3anU+pT
	 NHhZDEsXCnG91YXo1M8PxZmZIZ+j3dhIzuTrFE9Nl7mv6VXG62/XmCWjKd6vwVcLBJ
	 CquE44gxJ1DUg==
Received: (nullmailer pid 384607 invoked by uid 1000);
	Mon, 28 Aug 2023 21:34:20 -0000
Date: Mon, 28 Aug 2023 16:34:20 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de, uwu@icenowy.me, andre.przywara@arm.com, robh+dt@kernel.org, noralf@tronnes.org, daniel@ffwll.ch, conor+dt@kernel.org, neil.armstrong@linaro.org, Chris Morgan <macromorgan@hotmail.com>, samuel@sholland.org, airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org, linux-sunxi@lists.linux.dev, jagan@edgeble.ai, krzysztof.kozlowski+dt@linaro.org, jernej.skrabec@gmail.com, wens@csie.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V4 5/8] dt-bindings: usb: Add V3s compatible string for
 OHCI
Message-ID: <169325845386.384418.11147757539841975746.robh@kernel.org>
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
 <20230828181941.1609894-6-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828181941.1609894-6-macroalpha82@gmail.com>


On Mon, 28 Aug 2023 13:19:38 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Allwinner V3s uses a generic EHCI and OHCI for USB host
> communication and the MUSB controller for OTG mode. Add compatible
> strings for the EHCI node.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

