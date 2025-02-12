Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705CD271829
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381469; cv=none; b=HadbV2PhkH5tIcoqh3be9cT0khd97JW3gENbjQC2KNPgoulbaoh9LF/NPsec/JWQEqcMSuG2hYMxquHor2zto7idcMVEi2b6ULLJxWOSS9U/RnXvfHEKK/l9/FMyGBK0O+6Sp0FLrpZkHh6v0AV6wEl5yKgH8SCUEmQC2AFsvhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381469; c=relaxed/simple;
	bh=cCDE0/i6i24oZI4BzPX7w4nr9GHEOVo4Q2qZZ8UMW9Q=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvji07jyW9uaTZzHYRAlRFCmfcWmb8hvZOb2p/ypJ5wbK1uNXRBI839xsFKZETDQgtBaXk9CixcqMxwAb36SOBRXSzIyK98Vt9Vb9lg+LRE6MmmGSaf+Sg/PFVPOfCIqzgbnxwxcBbBH9OGCnMNwuWMLRkXoPCCvWRXbXku19IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx2o8MQw; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx2o8MQw"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5fc7d346980so1188872eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 09:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739381467; x=1739986267; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jbx6FcfP3bq2n5NRhn4rgJREW3IAUmWBAJQw6Shyrdg=;
        b=cx2o8MQw6loLs41eyD3x3vPB/UZTRhniS5a4bAfbZBUmFy4hLryD2jATIJmf676Lgo
         5GsFheT5+10Uinb9NFAHrOcqiK7RUavt5fTR2sRNXKHMPjiHaCUFVyss08q8u6fZYCFJ
         GzijOZ2/a//CY7gU+PQEUCYZNC4EdZfA3Oem8w4xUA7MOW2kFMZntUUqBBMKJeLG41Zh
         O1d4VKSvYIdFlzT44B8DoaLTXf1ux8yfWOfdkvKhwNTAgRDtKaao+HjscUjA9qPjlUD9
         YmDJAGGGtSS0JjVA4GVhHpHn/L4vx77MEYhWuaCey74cm0Egzg/sZoi9xzk1f4ItKpc/
         giHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381467; x=1739986267;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jbx6FcfP3bq2n5NRhn4rgJREW3IAUmWBAJQw6Shyrdg=;
        b=de25/MVVewQ+pfz+amIhXuZYXbiAtiUYv+8pue/8sCP3/t/q1q10KlQinaHZJo+j4c
         gZnQnuLLqlSAMrVaFS25A2N28kCn42J++8lWiBoyeeYRM7BKZdT6tYJjNjo85aKhyiGn
         C48E6so8883nbHKHKd6LOMbKtb0Wea2/qz7QALpMQNny6+5PLSRyESEArgqVDXcACG/G
         Dtl5eUXrM26ZH0kqVpfLDdCtrjbms+ue5MjsTGLlFEtx15iwLGNKJ9k7emWUWTeQCkO8
         ACH+b7J9hj8rm4sJPSlAMkFU3fpJGQayVbj9qVIWMqOIQLux/a4rE2ms7JTAzdu0vZaY
         hFQw==
X-Forwarded-Encrypted: i=1; AJvYcCUJlGD0mrmxW+5KicgF+tRZtrAF03TZ68Rv2oToOzIHBwqn5h7oYQSKQCChp5uXOI0IicMSEXKh+4yxmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3+GUqsjsvgoXJUIQlWPBx+N4QgytzLE6lFKYlLf+imSUfUqP/
	Pg8MgIYcvI/nHx5kBX0Ep/uKPerITdOcUWHLqlZ+UE3LfbSsOKSY
X-Gm-Gg: ASbGncvzPUxQk+szJrdrlexYLFQvi6mZYXGPGOkZAW/O+Tyac+MVw9i3rRhij0znK+b
	0j6iQwoIIshUgyKEYlronILw8nkwB2W2veuXAfH79QAGkrjvmU8BC1JKe8vcKKjwQD5e/B+gij+
	p14bT2GTHdlFF2igf8jKEH3rWL4xtciPU8b4qUwDyujufk5pMuFkuMh8YhfFeLztrdH3f59pJKU
	IjP/k9Mizz6D/Nep23ill//Os1QtPT29JnMw5DGuXJZohC5O0CjelfuZ0sgIMmijrtX2vQLBY4E
	0GlWGusLZ8Aib2xWkx7j2g==
X-Google-Smtp-Source: AGHT+IEfXVxl7VC/O2TXG5AUw40jRF/jqb2tNJhJqtHmv0DAX3h4yayluWuzrQzPBPHKrw7ZeZKhgw==
X-Received: by 2002:a05:6820:54b:b0:5fa:61b9:3e7e with SMTP id 006d021491bc7-5fca183ea60mr2464323eaf.3.1739381467421;
        Wed, 12 Feb 2025 09:31:07 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc8fdcbc21sm2233640eaf.37.2025.02.12.09.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:31:07 -0800 (PST)
Message-ID: <67acdadb.050a0220.28f58d.f522@mx.google.com>
X-Google-Original-Message-ID: <Z6za2bhKAmHvUMFR@neuromancer.>
Date: Wed, 12 Feb 2025 11:31:05 -0600
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
Subject: Re: [PATCH v5 21/26] dt-bindings: allwinner: add H616 DE33 mixer
 binding
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-22-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-22-ryan@testtoast.com>

On Sun, Sep 29, 2024 at 10:04:53PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
> 
> Add a display engine mixer binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> ---
>  .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> index b75c1ec686ad2..c37eb8ae1b8ee 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> @@ -24,6 +24,7 @@ properties:
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> +      - allwinner,sun50i-h616-de33-mixer-0
>  
>    reg:
>      maxItems: 1

-    maxItems: 1
+    minItems: 1
+    maxItems: 3

> -- 
> 2.46.1
> 

Also need to add constraints to set maxItems to 3 only for the h616-de33

+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-h616-de33-mixer-0
+
+    then:
+      properties:
+        reg:
+          maxItems: 3
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+

Thank you,
Chris
