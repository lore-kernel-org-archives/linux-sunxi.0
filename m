Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB63178F2D
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587439; cv=none; b=GDY9t2cv7QLiaWb11pYpghqiQnCS/Xcwfon8gUwr0Zsh0DXYOOAQCTpZbWaJ+4agQia5pPYJiadcz66rC8zQ8MDuHBWsg8xPZZQqzNJ29uFKCvXejvDCpPMEf3Yj2FR5dKxW27U+nRPYhl+2PZ8q8yIZhuUz0vrWp1uG9XL69oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587439; c=relaxed/simple;
	bh=1wzGwsHJk6GM4JVSRc5JQFv98aaci3bQp14s5F5hZj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsiYHW4LIIi1KlzZl1uM1gSMA0ALgMyntrp0E0drJBCmICc+ExdP5/X3B9UufrY6WIScNfK8yNP8/sMiH0DmAlo9pvpBCYFSOVS/25uYkqJsMCIYd9spl445H5p2Ap7hPVCULCgEF9J5qdAzbyxPbu1O9xAc042ikH6hUhT5md8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MADevWp5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MADevWp5"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ac9aea656so2680558f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 06:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587436; x=1746192236; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pKYXe62kLy/PK+NiFHwGFhROYiWY2U4thO9lzKIe64I=;
        b=MADevWp5N+i7uy+Brtrg+/y3WubDTgvK/Vim/B22tKtjsCQcuSzZIvpKIAkheMxgoL
         yWzmJxafAdtdoyvnuZm9+2/nhJxJZZZ5wzo5CP80ImYu62PsXdYHXyjLE9S4lWb4mGyh
         VEU96lc3E/7CGcdirHy8+okN2ZqCMgJks3PgLfzGuO13hOkDgOjs5ItGW2KNNM0wN05A
         P/lCt0PwFcAauelqBqspUMNKiAaXRZRF22GQyGBE/ZDFYImEQfdYNlbcFGLQkPX4mI6+
         tqeN6+ousGZILOdZ7VFtZJJk9/GtpZwE+/DzGP/56GzWqFX52ksPj4Up7R7h+u+Lk42w
         XJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587436; x=1746192236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKYXe62kLy/PK+NiFHwGFhROYiWY2U4thO9lzKIe64I=;
        b=pPwgiHUz1lmpW2DCQvmAwCazyjzbAjXlo9ztwu2rkOH9MovaQ47iugFoQrOK6pQTRH
         2X1gQlTNdY4iB0UolOXy/0Z9zfjWcErSWADen5a6m+KkmS3Vig2ZmvL6yXdzQpamMWUG
         Ga2gMwd73/v/7UsGdT0vKKXuqzMJn/K//J16vEzD+Ap3TT1kr9Pfx5gEHK6fgUfZxYO7
         x7/qmQXJxfQv0WrDAD4HwrLNDZUJRKjsTPZFTF7mH5elEWPVChO4Wi3qnJ2lgPdGZwuR
         6NWaB0nkfzKV5KmXkbao61Q1h4xsZY33qcRl4y0lMjYj34mQpSJI++uHR1AHT/wMjT3Q
         MGKw==
X-Forwarded-Encrypted: i=1; AJvYcCXbjfvQE1SniJfTpVV6qFy8QJT5w9tpeANz7hd7EhJm1FE3rqw++EzJ9GkhtcrqB+p/LY0t2csYa80sww==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfoIkvrZzYyOW2/FjBAxDTNABnAoFyDr2wrTUvdeYSLEzOC8Fp
	MBYUlbq31uwAwJ0wk7sBJd8PKRRCMJinzZXhrect8jJ5IjBofSKf
X-Gm-Gg: ASbGncsNJGeQ37YOf0sI9SAdcJhWV/+UXP2KicGplvV1u3DQkv/T59SQ8Canr5bngTF
	+oq8oIIzzf0C2b+suiHnYOfD7Nxs4AoqBqHVwbKJRaip3Zd8nVgBm/egDNITzgcWv9Wn3l5+26g
	2dx/8qWMxpRRjdCW26ayHui8FOlOJwC2RATe51BC+nr3Z/47hae8GyMRE8yBiGcrLBpDyQNlnVU
	9uJWCR+SkLfq8wY3Fc5Wsgpx0W9y39gJ81yepTtQ6FEgBNmK/xZyGJnv484fTzBUkTcKY7pJN8+
	CdxaK7JN6e0Z+TYZbJXnMq+D8AuAAzF6uyskDBzo
X-Google-Smtp-Source: AGHT+IFII0EqynEWPZzvrGLmpKWfS7u49UoGkuCQiAlKncT8hgoImF1ZrCzzJCNwbFrIyYmCHxOPfw==
X-Received: by 2002:a05:6000:400f:b0:39c:266c:12a5 with SMTP id ffacd0b85a97d-3a074e2e6a3mr2130241f8f.13.1745587436006;
        Fri, 25 Apr 2025 06:23:56 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e5d4b0sm2320381f8f.89.2025.04.25.06.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:23:55 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:23:53 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] crypto: sun8i-ce-cipher - use
 crypto_skcipher_driver_name()
Message-ID: <aAuM6SmS4Dhsdxfo@Red>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
 <20250425124517.2225963-2-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425124517.2225963-2-ovidiu.panait.oss@gmail.com>

Le Fri, Apr 25, 2025 at 03:45:15PM +0300, Ovidiu Panait a écrit :
> Use crypto_skcipher_driver_name() helper from <crypto/skcipher.h>, instead
> of accessing struct crypto_alg directly.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index 05f67661553c..f03a8fa7bfa2 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -17,6 +17,7 @@
>  #include <linux/io.h>
>  #include <linux/pm_runtime.h>
>  #include <crypto/scatterwalk.h>
> +#include <crypto/skcipher.h>
>  #include <crypto/internal/des.h>
>  #include <crypto/internal/skcipher.h>
>  #include "sun8i-ce.h"
> @@ -438,7 +439,7 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
>  				    crypto_skcipher_reqsize(op->fallback_tfm));
>  
>  	memcpy(algt->fbname,
> -	       crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)),
> +	       crypto_skcipher_driver_name(op->fallback_tfm),
>  	       CRYPTO_MAX_ALG_NAME);
>  
>  	err = pm_runtime_get_sync(op->ce->dev);
> -- 
> 2.48.1
> 

Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
