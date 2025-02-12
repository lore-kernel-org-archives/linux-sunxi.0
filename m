Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE092580EC
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381252; cv=none; b=fqftwuLndUhfvrg8lH0uQzf0xJq+nUy5HfAJOS/KZD+kTzEw4A5XYtk+ReqcSBHFa6UThxckiFvnJta40fiLPvs6iFiVwhP6YlgIC1mpx5Qu0fTDjH7XwaC6/+hN6tXAT9NV5KlRIhtt7tNz/2SMl7xjq6g1aDdB1vSPIXybAcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381252; c=relaxed/simple;
	bh=Tt+QV07QmML3nEGkXeeRLDtH8eKqEEk75s9TnV7KQ/g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEbBwpBRWWh+P73qMlbgoykdUOZbKJ83XyZeoB5MSXiOigJsEw0t0RGNOz17mbZrsjS7Kjvk2HKhlovayrIeY86QiPcTRJn4hycJTPoCyG4BrIZ1rK80vOeLrulUOZvOHJn6yS6enz8OK6h6+4EBNVOn3mXAFffM/9H1o12FJpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyKRiKys; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyKRiKys"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-726819aa3fcso4163595a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 09:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739381250; x=1739986050; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=beLRCGOxxX9cpZ21JwnULP9EhaY8G7Htxn7RQieYr0k=;
        b=hyKRiKysv5jBJs00dz008gem66ltewCA2hjWOzv/tyvVK6C+NXRPNhfKYN/uUIgu+I
         2Ye4yZezJ4mK/B03PZUDvU84td5dTU2UHlcrTGRp0DzFVBuu9M88sMsD4qLp1N1LRf45
         8NFt9OEnCFnfGgg4xS/XW0//EXyIMnwKXzMH40l194yy085TkJ6qZ6o38ys8b8KWDawN
         3sXzcPLy9/cubHVjUG+5pN3eBaxGP3fsomQrk7nme/fUlkJemVAUql6xkyGQEYpEJ7Ju
         7Fv++kZs1FasUaCLEBavdHiur3c8ZjhXHNAIkhkLkDj215Gtn85FXo1OylLxFQeTIwk5
         pUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381250; x=1739986050;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beLRCGOxxX9cpZ21JwnULP9EhaY8G7Htxn7RQieYr0k=;
        b=SMSs9sc/jekhuz3nDTu10snI2F1eYJbp9nbCUWYc4RncJkkxWEzTDgV88Kep25FasR
         vtmBA4dYWvXCk6lvqdnGoCZT3WjvBoaECq3KmcxkJPGFJS8o7bmh9PAOLgTOcaOtijsY
         DzYFVVUzxFNza/47xETi0+xwWZSly+RilSSaL7WUKjr6VLc/vjAW5VUYOOQnFTCpmUJ+
         UAC/uDqd0079Sc77vY2uZfrMMAEoq/kgKCfe4lnW9c7B95glfwwBwAs4xoeJkF+PZBbQ
         +GdJwZed8M1NsYiptww9jOEfp8FrD3vGVyftFlfyH3M3Ogp4jqBhrzbWDx3fcrXxf7FH
         KDWA==
X-Forwarded-Encrypted: i=1; AJvYcCWLBq4Xq3kv3RwHIgXP06o2U7YOVU8KEGYjdxbZip/Z0VJMbGSsgWjEYIKs8eIwKYx/Z4JzPZEpIXCuPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGz7FvvnN6E0lpMYUw/7CKWhAG2Y489YFgjo2O3KIaoUFJR97a
	XSrVFXyIWzeK5c0lMUpnYlhf6dODehvNDyENQr7y9yJiUX1PEfI8
X-Gm-Gg: ASbGncszgPUyoYt9Pn2wiHwps/X09EMSPU3rRA0tAgtxHmEdHlLbrXhTC4IURDCWBYN
	Gdp93myfxWo6wXpyXn02UXDwPAfqOq/j7tWR5TmaOjCn6wRzlG4BDmOVJVYeiC36b1RNNuuUDqt
	nbQjCAHJQ4hZnYOkRCardNwtu0cNacEPtpzdDUfga9XVNsGo7E5qmStqqf0Fyk3PP1U3mHUUOW2
	uw4f4LbivF2KJ+c1roJETZbt2uGOdco6q9bEh7DO/nrxK+z9QR01Xz0mnvWINbUNlTDxKhha7pL
	eFFiknT/CnD5AQWpNzSAog==
X-Google-Smtp-Source: AGHT+IHQ+r/B4g2h4U+MDj6Kx5Km7Y0OHx/D1NpwgCExrt743LdxVlv3VXUZQzCcXj0qf+dKJIpoeg==
X-Received: by 2002:a05:6830:4107:b0:726:eff2:9b57 with SMTP id 46e09a7af769-726f1ca8939mr2600982a34.13.1739381249618;
        Wed, 12 Feb 2025 09:27:29 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af932f78sm4722036a34.18.2025.02.12.09.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:27:29 -0800 (PST)
Message-ID: <67acda01.9d0a0220.22ffaa.f02a@mx.google.com>
X-Google-Original-Message-ID: <Z6zZ_2u-MrZUZnKF@neuromancer.>
Date: Wed, 12 Feb 2025 11:27:27 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 19/26] dt-bindings: allwinner: add H616 DE33 bus
 binding
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-20-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-20-ryan@testtoast.com>

On Sun, Sep 29, 2024 at 10:04:51PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add a display engine bus binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
> 
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> index 9845a187bdf65..ea7ee89158c61 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,7 +24,9 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>  
>    reg:
> -- 
> 2.46.1
> 

Because the h616 uses additional reg values, we need to change
      reg:
         maxItems: 1

To
      reg:
        minItems: 1
        maxItems: 3

Thank you,
Chris
