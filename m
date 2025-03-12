Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56D923F39C
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 11:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778739; cv=none; b=A34OHs9lkvG9fOVRg4VZ8Zy2aqLo+JHU0xOjvNd/rBeA07UvOISwWTLqhCDR94Cd3vod7p2NXDgimYofqBBS6RSXAj1ROcvx1nVdyBRdG1X2xAzcKQJX0/mEns5sS/zLiWuWDH+L5vif0ERnqEijeFZc2wYF22jhJb8cjcAA5/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778739; c=relaxed/simple;
	bh=zKSN1MPByApvA+OUlh27K1FJwz3QmJ32fWxe2xd1RGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nob9bAKN8ancwNEAw1KghwC6KNQGbofP2CRZa+66Ij1gzzg/iRIVHvV0Uef7B0eeQYF0xOGMXGUxC5AmuMM9GgcvQQhAtN0XD4MYu/CdI3BF0MwVPORmzfzAxP8cdMLEY2eflQpSst/elENTuHsrluJMAUAKwdstvazUdsgldOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMnPS9Gm; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMnPS9Gm"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6fee63b9139so7184897b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 04:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778736; x=1742383536; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMmWW278S3Hwy+hLP82+XTpci0VAB4ee7BNXBj9aT9k=;
        b=KMnPS9GmKr4zDmb/B/4qs6QQ4SPAM/WaT0lUyVRiwElRhzKwEVCFYYapUHJxewuyRT
         m2Ejv89zeVXCw8KY/r1S9W1WHAZGB+CKrESFYpSYP7eiAIRvMRwPG2uCIW/J4Tl+iaRn
         DqJzCYThUyeRxWxcb+bIeRZL534ghCSVRvql3d9beAIPPP/6rrNuLxDAqy5tawqQ4+QC
         gB08g00ta9Pp+i+BBRDBSYToHDRwB1aQcoyL/NQsrxiNYhoLKpdtncsKxdDODTaagZq1
         h5tlLbcY6MsxKsYvqK4Q+qjKPuIipd2KBBoiwW9dqrMRfBAGjLw+ffHcXDo5ZFUOiWCb
         bMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778736; x=1742383536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMmWW278S3Hwy+hLP82+XTpci0VAB4ee7BNXBj9aT9k=;
        b=RjeVtmsFrMP09zKlSjPcW+mdQCe0fsBvXGlJTn+i6pOril+i3MFPRj5lK+V7VnDcE8
         KWnZsnUtWiD8LlY+zcYaJvl13NR2FS8nkZxx/l6FbOyESATTiiUT4ptw0PseKTFVfPDD
         cl6kQjr8qaMGGhhc8YMw7i8Y+3REYFBG159WW2j/YUjGQTPjTQeWozHYDNE1ClDe6gpH
         JSSAGDfnzm+UydRbVFtNAwcTivmBjyM9xl5IE/mn1NtPR3LKOIAR4CTL+9Or43cn6LLm
         eeuPkuRZRzUF89od9QYq6VByyUyd/CgHRnUmwQCcKYtl1JRq0epdLEJqXPp4OJeDLfct
         RiOw==
X-Forwarded-Encrypted: i=1; AJvYcCVdLrguFAs9Vz2ahoi86z783zkA1yz7bhE1aYPKon88kZkIAktGoKMnQDydgGKx7Ee+ARfU6A8BRSVhRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeuK9Kz9GGkSan7Ve8iKHqNeD4fGAS+2V/mzjqw5jSPwq7PwPk
	p76uxWnv3OeP/93828UjPCBH6qCRxRJuHQJKZaYuYX9JPHc9TJxefTzbQq1swgXdVt7PTkktaTx
	3XkE+u6Rj6Iv/2VPhD8+vJPff8Ykw8sWnRa7gAA==
X-Gm-Gg: ASbGncsyWXul4zHGrgR2KD8rYW6yCltKPwydQBQ7gp1nrVPPNub0pS+tCDYBo5hZNAt
	Hc3pAvJv7xlqRL+QNKJOlfc8Gvgz/oU6yVTw955YHabXaiH6pCRpgR8iGWefR5nkTl72LqFt+rf
	sIj3IPSu+AaL4oqruU/tX8pqv3Gmk=
X-Google-Smtp-Source: AGHT+IF+2TUj0AijHF6r+vPxRqI/7rfE3ie+f/dBAlUG+gV7qBwbChu82fS6cFOmTtK6ezNyic5kn3RkBhCY6+/TI2Y=
X-Received: by 2002:a05:690c:7207:b0:6fb:b38e:207e with SMTP id
 00721157ae682-6ff0a33c8f8mr83949777b3.14.1741778735829; Wed, 12 Mar 2025
 04:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250307005712.16828-1-andre.przywara@arm.com> <20250307005712.16828-2-andre.przywara@arm.com>
In-Reply-To: <20250307005712.16828-2-andre.przywara@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:59 +0100
X-Gm-Features: AQ5f1JoiQnCX1EBg93UaXE5EJlbj1n7TONyL__Rgw9VQ-gzhs1UrEpRxnqBou7Y
Message-ID: <CAPDyKFpFgNjy+Tu7ZKB05m55HAf5RQ+AFPgk+6Q8_g1xu0akng@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: mmc: sunxi: Simplify compatible
 string listing
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Mar 2025 at 01:57, Andre Przywara <andre.przywara@arm.com> wrote:
>
> New Allwinner SoCs only occasionally update their MMC IP, leading to many
> pairs of compatible strings, though there are sometimes a number of them
> being compatible with one particular SoC.
>
> Collate the compatible string listing in the binding, to group those
> being compatible together. This makes the list more readable, and allows
> for easier addition of new SoC's MMC devices.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 36 ++++++++-----------
>  1 file changed, 14 insertions(+), 22 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 0ccd632d56200..8e4c77b7e4ab9 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -30,38 +30,30 @@ properties:
>        - const: allwinner,sun50i-a100-emmc
>        - const: allwinner,sun50i-a100-mmc
>        - items:
> -          - const: allwinner,sun8i-a83t-mmc
> +          - enum:
> +              - allwinner,sun8i-a83t-mmc
> +              - allwinner,suniv-f1c100s-mmc
>            - const: allwinner,sun7i-a20-mmc
>        - items:
> -          - const: allwinner,sun8i-r40-emmc
> +          - enum:
> +              - allwinner,sun8i-r40-emmc
> +              - allwinner,sun50i-h5-emmc
> +              - allwinner,sun50i-h6-emmc
>            - const: allwinner,sun50i-a64-emmc
>        - items:
> -          - const: allwinner,sun8i-r40-mmc
> +          - enum:
> +              - allwinner,sun8i-r40-mmc
> +              - allwinner,sun50i-h5-mmc
> +              - allwinner,sun50i-h6-mmc
>            - const: allwinner,sun50i-a64-mmc
>        - items:
> -          - const: allwinner,sun50i-h5-emmc
> -          - const: allwinner,sun50i-a64-emmc
> -      - items:
> -          - const: allwinner,sun50i-h5-mmc
> -          - const: allwinner,sun50i-a64-mmc
> -      - items:
> -          - const: allwinner,sun50i-h6-emmc
> -          - const: allwinner,sun50i-a64-emmc
> -      - items:
> -          - const: allwinner,sun50i-h6-mmc
> -          - const: allwinner,sun50i-a64-mmc
> -      - items:
> -          - const: allwinner,sun20i-d1-emmc
> -          - const: allwinner,sun50i-a100-emmc
> -      - items:
> -          - const: allwinner,sun50i-h616-emmc
> +          - enum:
> +              - allwinner,sun20i-d1-emmc
> +              - allwinner,sun50i-h616-emmc
>            - const: allwinner,sun50i-a100-emmc
>        - items:
>            - const: allwinner,sun50i-h616-mmc
>            - const: allwinner,sun50i-a100-mmc
> -      - items:
> -          - const: allwinner,suniv-f1c100s-mmc
> -          - const: allwinner,sun7i-a20-mmc
>
>    reg:
>      maxItems: 1
> --
> 2.46.3
>
