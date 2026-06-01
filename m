Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DFD3D7D7F
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Jun 2026 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326499; cv=none; b=fY0vp5N58Ui3eiluH9pX0sVlIezSjoLrX+6SN2jPSF62sfRacbUUWYY+I6iBGtmhz5DZkEUdDKaHKfBS31lcddf63QnoTnOcYHY9HC8NU28Eo2nhtHLzhvYw0OmhYEjhyxmWNFl20QbNXCLlunLJRVftjwdkiVaPV7nqlQXOf98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326499; c=relaxed/simple;
	bh=8cYW1eZoP6NBNGgjXZ5EeGzBWJiUFyOZDDX8DreahPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaqCq88gI+PgkWbKCDFMNU+eKSbfOIyH8wiQo6Vhg0A12ATEFdrOp4XBm75b0xQfVsGH3L5pAwH69/qlumxIcto9weexySR/fKMgf+ZY/PCcdxIHNrkSqhKDmNoY6/sGu5/tREZ2GW34vTkSjpMSgdpQ785YwZgk3Wuogyt8roA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipxuvkTj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipxuvkTj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45fe59255beso851152f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 01 Jun 2026 08:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326496; x=1780931296; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/iDvFkdNstCMV6U6YBcdPpzEdn9fHll2vJW0mE3op7o=;
        b=ipxuvkTjXo407ua0Xg3dJ2eY7mP/BMkwax6kH3QnC1Xpx/nKjbE+6kZXw/BH/BHuz+
         NF6BdRhiCtbX/iCqYB80OWZS0FHDPC3+V12rw4okiAtaHP4xU5X/25oxxDsk9NNHZ9fG
         r6OjGg/mziH/aUCbFC9n2sZBEEX96TXXy4TTxKgCUiCJeiJK67+H6+w9FVjLqxPrhAen
         aXwU+Tf78/d+UrjQAuCmjFfEX2WQ3PB9ZJYKPojk3m2UPtcaVId4iyOe8ZPzuNp2mzgU
         k8O957usptbIl3rNTpaXMltxYj4WBHWDpR9uX/NKHJFu0iEceJcYes9VE6h1AusuXGRy
         S86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326496; x=1780931296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/iDvFkdNstCMV6U6YBcdPpzEdn9fHll2vJW0mE3op7o=;
        b=bmWd7a5L7MfUhOXYjyWhNgua27KIkgDkSHgsM/nEt8aPy1jO4OhjMGGK7BCAKey22g
         GEDYCYccbzLCllmuVDwkDVy7RbmRC3/oarHFVj5yaGjN7hzLkDpp/LqHVdpikxkOk41q
         JD1COQboYG8DBLUWiaGoZpN3uOkD6ajN7Svue+Repk4OcVZ1baIuPJojNZ9/l0iUlbrY
         G7UgyXkCyv/yEmAyXxh00pT9uM3shgs6DHlJJoJrz7nlZqNYSHluWOyrE1ICl0Lc0fJR
         icHrxCQQWDRvVOAm5NHmse0ik95o6XdKxzvdWr8Qtle6/It3+rsiFQZsoeidGj7Wuiu5
         CG6g==
X-Forwarded-Encrypted: i=1; AFNElJ9l6HdgdK2FuejExyGl8Acm39wolP9SQGPORG+cUNzlltJrFSert/eKMlkeX/Xmsjk5kYd8MfVC2IjNQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWT7LoS/at5hEC3KuIrqV9DupqfF1946ENQRRTj+T28JkdyyS5
	j3kYvWrbea950SYoLregV4daaYVoAic5UyHQJg0ZMwc9xyzhHwZBoVtJ
X-Gm-Gg: Acq92OGrGvDUBHdfLrSwaWdUESCCyAuOlF6QvQgt68WN7oEHlPHNU5rvkmTgWidoDgI
	SQn88EZ/zQcltVeGteAT8bf+8SjV60g85ZAViupJV8b5BA52j/XAjYpJE5TR8fxOEVO8r8+o2YI
	6uQXHSCZOzu1TbqPOc9tJsnVoUNwzgWjMRdjQT/f9V3CAY/YVHqzCop2v/KaWqARyGX0EIAw+av
	jDLiLFn8SstYOoKaWbCAhb571t0y8DUSWxz2tbLvclQ1ynnRyauYZNqwLuHxqZHfoZA19eTcVz2
	9s0feQ4oHTPsSKfQUQ0Xf1w1ehLJxMYNyp1ZOOCtIR6m57lAUCRnKpkvF4HqqOz/Cg0ra4YsQ65
	qGedZk8PQmlOKTnDgyEvGiYGZMs0BymMjMMkrrkL0//3rJw4hQJKnNAOGz1y/Yk6Nd2TiP85aU8
	r/VnrcJRcYiM872Xf6kipGNLOehFrtRnY1rw==
X-Received: by 2002:a05:600d:4453:10b0:490:6869:ef13 with SMTP id 5b1f17b1804b1-490a2918e9fmr148899075e9.14.1780326495794;
        Mon, 01 Jun 2026 08:08:15 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c6319ddsm245702965e9.0.2026.06.01.08.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:08:15 -0700 (PDT)
Date: Mon, 1 Jun 2026 17:08:13 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, stable@vger.kernel.org
Subject: Re: [PATCH] crypto: sun4i-ss - Remove insecure and unused rng_alg
Message-ID: <ah2gXTMxfH-ux_J2@Red>
References: <20260529193648.18172-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529193648.18172-1-ebiggers@kernel.org>

Le Fri, May 29, 2026 at 12:36:48PM -0700, Eric Biggers a écrit :
> Remove sun4i_ss_rng, as it is insecure and unused:
> 
> - It has multiple vulnerabilities.  sun4i_ss_prng_seed() is missing
>   locking and has a buffer overflow.  sun4i_ss_prng_generate() fails to
>   fill the entire buffer with cryptographic random bytes, because it
>   rounds the destination length down and also doesn't actually wait for
>   the hardware to be ready before pulling bytes from it.
> 
> - No user of this code is known.  It's usable only theoretically via the
>   "rng" algorithm type of AF_ALG.  But userspace actually just uses the
>   actual Linux RNG (/dev/random etc) instead.  And rng_algs don't
>   contribute entropy to the actual Linux RNG either.  (This may have
>   been confused with hwrng, which does contribute entropy.)
> 
> Fixes: b8ae5c7387ad ("crypto: sun4i-ss - support the Security System PRNG")
> Cc: stable@vger.kernel.org
> Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---

Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>
