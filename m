Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041F03208
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751983504; cv=none; b=d+UbigHkTfXLtIkTqfjC40knNoPNeyDf+EIXRQK0t4ls702xyRJ7x4FcT1bxQHUnXQmRWuVFL/gPyosTPO1uCvBjO2e6p+BQKnUjCFJxlhEIUXFghz2ZuFa4sdtBjPDkgHd0RY5MoUWRl3UI2qJxpkdV22IATfA9yfc2ayfbsL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751983504; c=relaxed/simple;
	bh=NBLxj2iyNEYe0RkPUYz8ceMh1dxW6+f8giBxYHZCfFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9xsDgAy+tREL3r1z5H1lp84H2NRSbm6B4y8Ssf1+O8ib2jjLbk2aACNzsZ/m3QjDnUvLeqTDz9uojMFbxkzIwYrbeGUFk0595NVyriAKRZFB6yrEVIRPYY/M/ilV9/czNWsz1BUsMHpOr8bpbn6CX2gV6l70o+r0VgVJ4y962M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9XPvNvp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9XPvNvp"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so26327295e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751983501; x=1752588301; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HtyOMEbmKhYccPR85zPZqi+3OXt4HRCWKlkTUzeAlK8=;
        b=J9XPvNvpovvsZf6+9IXgi8Jgrci4JDFWQNw32YE07uAfcVXGctoTys1hQ40ylaNUpd
         nJk8kt+sNMcTipu5pg8C3or+r7QMmxdU8p3ZLlGsWUnsxzF5O7n2kk+VOa2EDaTtyEvz
         0vYyztNu1NpDtvFpV3x/y/WpsjKVE3zCD1L9M+g3yskTUleHcRP3iIuwSgIFrbW385Kp
         ARLwOr3qPJuYEGScT8QVKCyIvE55Rssr+gsOcaWSDOE2mxPE/zoRiMCapuXFYtifqChY
         ea0ZEUCR85DXEcytYW7ieg+/5EyLbqu4nc4fIsOwqBM0O/+g8zZbOn9zcCcI7Dw1YaFw
         5kkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751983501; x=1752588301;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtyOMEbmKhYccPR85zPZqi+3OXt4HRCWKlkTUzeAlK8=;
        b=AxY5q9IdmS04lGlLa/FExUtMnndDDVRrz2evaugFC/QPnNAL3GjSEXgyRdQotYJ52w
         SEzQgLgowb7ThSHkihexY/JloQfv/pPbl5s2SEYYfyr0WiieUBnzaAje5DfyGEA5z10w
         0DJoUrg/cOWkb3bdtyL5W2LDGGn0VhNf7jSb02PVpmUmLtZIeW5odyY/RZCjJiPkPjjn
         /jWYRvgJhCDBrNI7RNP2D7aeuzT1oBnk9m+4X8uokMjTVJmmEKjptM7DRMToqQOBiUMw
         csAbnys1nwBrXV3jadvDwnvQJ2sPuPBh127uCPZiYrmGf+dPSHT7WyKC6kvvI5cbeela
         oh5w==
X-Forwarded-Encrypted: i=1; AJvYcCWhnvXUknLXbrc2T3mTsSx8y0dFOu+pxlP8hYdvS9BQOtN+RTyKPXIVAcAM8N8P8csA5QewboI4RlKCdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNfLl2prskdMk9N4eBC84/AkQcSTKis+6+E22qp+YW57NKjeCI
	6cElunBbRqPp7xHQ4FOVjmOAzMDLUlvs6gnQSMUdzrEKLjUQ2KkIDKnn
X-Gm-Gg: ASbGnct3Us8sJKK6XbeqVT6m9onInr6sXZ5mooFQw7tbmJKshIqK5oeczPzkn0swJFO
	0+9WpLZsJ6Rj4Ve4EXXu1Pq0PPTm6hhMzkTJzPyr5cbyXWr69gjHRDrGHY6821MlxwvgWoLfQgO
	s85c/W31AnjQJShyeDf5JwvH2x9BjFdy7ySxD7e+j8ccA7eKZ3RtZ+xqv9RzMPjeQlZK+h8csEd
	EQxo7iAb2S4wCirRXLky7SubbKWPb3VZZbVjH/DwW7G9jGTPxtmsLo6S/BF84gc4dpk/LUWuLdu
	BmAoK43OPMz/kcOHmiwsqw+vQEng6oIZONGaE9JlO1foLasBphGYAfYRSGG2nQ==
X-Google-Smtp-Source: AGHT+IH2IcGnzTu4f5ARGuOr251NCQFPNC43aWQKhhYdtFHA2gXGRsOu9touosxAKfObj0pUusrlfQ==
X-Received: by 2002:a05:600c:8219:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-454b3107ef7mr149559065e9.2.1751983500451;
        Tue, 08 Jul 2025 07:05:00 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454cd38f03fsm23612485e9.5.2025.07.08.07.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:04:59 -0700 (PDT)
Date: Tue, 8 Jul 2025 16:04:57 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] crypto: sun8i-ce - remove boilerplate in
 sun8i_ce_hash_digest()
Message-ID: <aG0liS6ZSr9HF_EB@Red>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
 <20250626095813.83963-3-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626095813.83963-3-ovidiu.panait.oss@gmail.com>

Le Thu, Jun 26, 2025 at 12:58:05PM +0300, Ovidiu Panait a écrit :
> Retrieve the dev pointer from tfm context to eliminate some boilerplate
> code in sun8i_ce_hash_digest().
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 

Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Reviewed-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
Regards
