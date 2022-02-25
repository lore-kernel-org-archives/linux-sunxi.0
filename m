Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214ED7B
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Feb 2022 08:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C80C340E7;
	Fri, 25 Feb 2022 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645777359;
	bh=h4M7TWzHmz7Q4X/YiAL28HmdTihIVjng7o6LYmmkWNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAEL1AGWbVLcycWd0/6g8QhGPWjYxN/45/iuOlg3/zW78PTzfZK/6D1JU7InhQ31k
	 nq6ws4/J1G+p4nla6VE31B74uyD96bSW44jLYvoPFMxy0Mnp4WukWRD4qMYsow77WP
	 mBaxTnK27z/JhELuXVDfPsOS1O7c3ySA2yNE8n2bboODB/K15ghThfuYY2lY00FrKi
	 jcWJXsR0/tNjeh7Hv3+n/YlUEc7CKM4PkSX/npOKn/pMdzsvvJKNmu+qP2/DuPcT54
	 H4wNmSTeK43ZQpGeYfDj1JjSF+YbKx2Ly1TaHcDRoWNstzFqE4GBGhgFOvH6sXrRM/
	 g1WN6GyaZrN9g==
Date: Fri, 25 Feb 2022 13:52:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: Add compatible for D1 USB PHY
Message-ID: <YhiRyq7k5jtSKlni@matsya>
References: <20220203013558.11490-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203013558.11490-1-samuel@sholland.org>

On 02-02-22, 19:35, Samuel Holland wrote:
> D1 features one OTG port and one host port, like the A64 SoC, so its
> USB PHY supports the same set of properties. Add the new compatible to
> the existing binding.

Rob?

> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> index 078af52b16ed..0fa4b32b097e 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> @@ -15,7 +15,9 @@ properties:
>      const: 1
>  
>    compatible:
> -    const: allwinner,sun50i-a64-usb-phy
> +    enum:
> +      - allwinner,sun20i-d1-usb-phy
> +      - allwinner,sun50i-a64-usb-phy
>  
>    reg:
>      items:
> -- 
> 2.33.1

-- 
~Vinod
