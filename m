Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0BB2F2A
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Feb 2022 13:44:27 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id d7so8527446qvk.2
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Feb 2022 05:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6lhbJS0GQ8mSlFcNag0PBxP0WGnDTDUPZws9Tz2PKEI=;
        b=djbgnFp0jRUiHNYN++Rl54ifwO+uJP1Z9CKlVbG9wOodF94VGth3zjVzLGvDeLpdrf
         X0WumOKGg4UssP7PK/s0SdCVpbJ5pm5E6qZOdEpxXcsLGbvEe3gFRHhziUQRnTvcXU4P
         d4it3tV8rdDUbiiSJRAqUnYYE8v10gTGd4sOuhfCeL54XsxFz08UODpJFk8TBRYyg0WP
         hwCRy5NPcFltiMl1H9Va4fhPGYQ1jd7bZF251ew/AM4/Ssw+A+e7hXIysaPnz3axESWX
         IuZlSQwYi6agz4fIyf1h35UZQ5CT39Y5iW9n4qjfOjD5KkY6AKJUZrBgsamLj+vvxWA6
         SPQw==
X-Gm-Message-State: AOAM530m8wIPks0TeUvjhISn7SOtuTBpgrqCg/hlH7QxW2xIuyNXX0yc
	HoW8JWEsrEy5rV3P3tc7Rw==
X-Google-Smtp-Source: ABdhPJz/GQx4DrcuRyumqsUxwIwOhB2hk1F87XYv+KH6T6GL86RJ8Ae/elMqLbPnS9bSFeuk3m9bXg==
X-Received: by 2002:ad4:5be8:: with SMTP id k8mr1052760qvc.118.1644587066095;
        Fri, 11 Feb 2022 05:44:26 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20dc:156b:8f01:9329:d9ca:df6f])
        by smtp.gmail.com with ESMTPSA id e1sm3913830qtw.71.2022.02.11.05.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 05:44:25 -0800 (PST)
Received: (nullmailer pid 266317 invoked by uid 1000);
	Fri, 11 Feb 2022 13:44:21 -0000
Date: Fri, 11 Feb 2022 07:44:21 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-phy@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/4] dt-bindings: phy: Add compatible for D1 USB PHY
Message-ID: <YgZoNXpdzTz4mh5F@robh.at.kernel.org>
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

On Wed, 02 Feb 2022 19:35:54 -0600, Samuel Holland wrote:
> D1 features one OTG port and one host port, like the A64 SoC, so its
> USB PHY supports the same set of properties. Add the new compatible to
> the existing binding.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
