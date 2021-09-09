Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38143FC7
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Sep 2021 01:19:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 857226115B
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Sep 2021 01:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631150361;
	bh=tdVbevl+aDxkyATd4nlXrr1019b4HiAb+ZLlEGHbwho=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q1cyOUprqpdZbEvLayrMh+mgppIefqI49VWGrjQaxSkIo3p8edNilgRFSQ/PBay3g
	 RIZqxA7/faqLLgi6WzltBQq6k/FYcp1dZc/Dj6kLN1F5fS2s/CXhM/MfoK2i+0qLto
	 B8kaguNhOqUjr+uaARmTfKhUqFtWTNHHUPbHVUC8mfFC8Ix0y+zpmdB+pmzy8x9t6u
	 EDXVzVHCsojsJ/W9au+/pBYBIkosPdkcbY/GGGgAjS7wrVBF2g4sx9IvsbRUY7wrSz
	 PYku3jC5umtQkaYT79SNtPrPnzPPi+uN/MmmgOthkKCJCcenviiYho21+/buRiX0Us
	 B+krK1cbzsdLw==
Received: by mail-lf1-f45.google.com with SMTP id x27so270477lfu.5
        for <linux-sunxi@lists.linux.dev>; Wed, 08 Sep 2021 18:19:21 -0700 (PDT)
X-Gm-Message-State: AOAM530CwzIhVRErB0D7vi6hCN0VDCZ3+xosegFN8YTeyMWhHprvXGOz
	2ZJObmwVoQnXwEGHMuIFsiAEfyVzHH3jHli59ak=
X-Google-Smtp-Source: ABdhPJzbQK5G5b2Cj872WktC8knYxqKRlLbs7wzoVrTt/pg7AKP6TRI9EoAf5LGLuAMBSVQjoANdrbJscEpZXpMnElY=
X-Received: by 2002:a05:6512:3f9f:: with SMTP id x31mr401134lfa.233.1631150359914;
 Wed, 08 Sep 2021 18:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210908030240.9007-1-samuel@sholland.org>
In-Reply-To: <20210908030240.9007-1-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 9 Sep 2021 09:19:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ=RoXouwL75JfmxOFzj+x5bfTW=Ae_3Ufyg3ZDA_Qj+Q@mail.gmail.com>
Message-ID: <CAJF2gTQ=RoXouwL75JfmxOFzj+x5bfTW=Ae_3Ufyg3ZDA_Qj+Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: sun8i-emac: Add compatible for D1
To: Samuel Holland <samuel@sholland.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree <devicetree@vger.kernel.org>, 
	netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thx Samuel,

Acked-by: Guo Ren <guoren@kernel.org>

On Wed, Sep 8, 2021 at 11:02 AM Samuel Holland <samuel@sholland.org> wrote:
>
> The D1 SoC contains EMAC hardware which is compatible with the A64 EMAC.
> Add the new compatible string, with the A64 as a fallback.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> index 7f2578d48e3f..9eb4bb529ad5 100644
> --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> @@ -19,7 +19,9 @@ properties:
>        - const: allwinner,sun8i-v3s-emac
>        - const: allwinner,sun50i-a64-emac
>        - items:
> -          - const: allwinner,sun50i-h6-emac
> +          - enum:
> +              - allwinner,sun20i-d1-emac
> +              - allwinner,sun50i-h6-emac
>            - const: allwinner,sun50i-a64-emac
>
>    reg:
> --
> 2.31.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
