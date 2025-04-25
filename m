Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FAF42069
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 13:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589225; cv=none; b=BABPDZlVeJQpFzt0OLiU8jqLqDbA4Wnd7AMfopY2MNcwqpJrtZMSRLQ8z+ui2B8hRVpkETrw4lkx5za0DPfvsDDv6/7Iosd1vBY9rOctL6fdKSK8lYnwV/ieoQX2V/cdSX7iRy9GnGjSAfAeO7xM+dCUpq5Zy4TIcqfkgoYvLl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589225; c=relaxed/simple;
	bh=Tgdzoq0uRKVDCSs++A8sHBpH8+Vxgrwn5HHj2Ya/53I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2zrJSKRgRiw9Cs35Auifa/b0O/AR7LAFGCGD7bMyCILyRFZ0KFlpltNgq1pGF/ccpa8maBBIQSdz16AifuaqdkfjgL5E9UpsnLZKhEfL4rRC2uzXhi+tkSwgjScmoo3iEbHzBzoTXay+FCnYyoxT047Hvz6erKlHJezL57JXFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGkau3in; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGkau3in"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3995ff6b066so1237772f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 06:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745589222; x=1746194022; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zC5qCt8mPMFjOd0IN3TufN+hresnNEqhnO+6fQbRG2I=;
        b=TGkau3infOzQEzLyLa9tIvBbK+PyrkPKGipfUkqL+dlQc3faK4ziqWkitVy1blGvmw
         zvosQYWq0B+fJiLExVzA6fJO3KjIwagEA2qoNA5rZ9bxrAq8MKDEtMS7Savz2DNmeAMy
         jIk9o357U4r+TljFp4hslPqyOYutYCHsTw1aEYIwc/K/QirBJFtFhYjTsSTZiAV4DSGd
         Rc7ASHHHATTWCFv2nK9VmhYfNqxRL/nsr4+nREx9d5iwX/vpzTvh/pI97KeyFzTSkmMT
         NR7Nz7PIOggbZU6CG3RzVv6h5PPqpOQ7apDVyeY6m+ZFZEuReo04rjsY11FqsSe804p1
         s6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589222; x=1746194022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zC5qCt8mPMFjOd0IN3TufN+hresnNEqhnO+6fQbRG2I=;
        b=TfQ0CsLcI0mD6puN75JHHQxbfs9ut/8QvR3CPaxxEhR65iprCtQDurHffzBCpvYHX8
         Kl9l57+6e7/3dBf1o+bP4j4YXAk3aBkrxrsxJhhvO3j8TimkIwyLoFGfOA9NNekOExdG
         QRGpc42iZl+pxuPOC9N91yiXDW0TiznTYeLbwl6iHNEnr2dmqjTS8+Kyj4wOSmF3sdTO
         QEAE4q7MhvoxbeS12RUCoIM6ieHOlZUUSBG8Jv8hqca52MbAOb5qLDyO+Qqdy5N2wQ0+
         pA5YcT+CF6aNoivuk6jFb0RoTnKQZSkRIYqU61nKLKwDWjjb3gzdx3Do+XGd2qelFR6G
         tNPg==
X-Forwarded-Encrypted: i=1; AJvYcCXbjqZ/fcwFGV23wTWMEzgN2gkFBrKUNyZY6K5Dv3oulqnRi9dkVYs1Pyb63mnGbgHWBMA/8MS8OW+XNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyFvbMqqIHcG2HCld8NJ2oCQcwpdumaVjjODVEHBsR7JLL1BB4
	FXn8+NplimT2qc4osEn8D5FRHhVzJtKqyUICOH4LBmRgRj1V9GSQ
X-Gm-Gg: ASbGncv/FvuubdM75cjakHQ8bsE3Mu2qHVkpu0vJ5qAQIjsG/griFLyVqR9d4XU29fo
	h6mNWgJ9E87n4qL1vO7hoYr0DsFuB1u3Z/nUDR7DCN4YIu2z1frbzMaQi+C7w7e1Lw5jScsl5/r
	mnEyz82C0iKRdcPk/Tj35TlvWNe2ndTGN2dppfX92jVn193OO9nFk7wnDxnhVCzOTmndvY6c8VR
	bam8Sxyf99g/sBYlBoRGW3OtFIg1Crs1L653JdMPiBw0C/gtYGEhXit03NcVK/WdDVIs8RxO8sJ
	QlOcQ3xROQXtMmnD3DFcnpQVnGoGe+v2qFvM56+u
X-Google-Smtp-Source: AGHT+IGIeg9vP39s+96LGPXe7HvCLrwPRTVeAxK0tbQco/f365rtXoIkERRGnWA87K7ViQhH9sGePw==
X-Received: by 2002:a05:6000:1849:b0:39a:cd84:a77a with SMTP id ffacd0b85a97d-3a074f398f1mr1823393f8f.37.1745589221600;
        Fri, 25 Apr 2025 06:53:41 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e46a54sm2462098f8f.67.2025.04.25.06.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:53:41 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:53:39 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] crypto: sun8i-ce-cipher - use IS_ENABLED() checks
 for debugfs stats
Message-ID: <aAuT4z3XC2mayIf4@Red>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
 <20250425124517.2225963-3-ovidiu.panait.oss@gmail.com>
 <aAuOdDhpnLE5bM_y@Red>
 <7653bf7c-03ac-4f94-a80c-2bfa3004d287@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7653bf7c-03ac-4f94-a80c-2bfa3004d287@gmail.com>

Le Fri, Apr 25, 2025 at 04:47:35PM +0300, Ovidiu Panait a écrit :
> Hi,
> 
> On 4/25/25 4:30 PM, Corentin Labbe wrote:
> > Le Fri, Apr 25, 2025 at 03:45:16PM +0300, Ovidiu Panait a écrit :
> >> Add IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG) checks before the
> >> fallback counter updates to make sure the code is not included when
> >> debugfs statistics support is not enabled.
> >>
> >> Also, drop the existing ifdef guards, since 'struct sun8i_ce_alg_template'
> >> is always defined, even with CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled.
> >>
> >> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> >> ---
> >>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 46 ++++++++++++-------
> >>  1 file changed, 30 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> >> index f03a8fa7bfa2..433cd18f0b5b 100644
> >> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> >> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> >> @@ -34,22 +34,30 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
> >>  
> ...
> >> @@ -101,9 +117,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
> >>  		algt = container_of(alg, struct sun8i_ce_alg_template,
> >>  				    alg.skcipher.base);
> >>  
> >> -#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
> >>  		algt->stat_fb++;
> >> -#endif
> > 
> > Hello
> > 
> > You put IS_ENABLED everywhere, but here you remove it, why ?
> > I think you forgot it.
> > 
> 
> This is already part of an IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)
> block, so no need to add an extra IS_ENABLED() check here. Just the
> ifdef was dropped, as it was not really necessary.
> 
> Original code:
> 
> 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
> 		struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
> 		struct sun8i_ce_alg_template *algt __maybe_unused;
> 
> 		algt = container_of(alg, struct sun8i_ce_alg_template,
> 				    alg.skcipher.base);
> 
> #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
> 		algt->stat_fb++;
> #endif
> 	}
> 

Oups sorry didnt check with enough diff context.

So:
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
Regards
