Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225E13541F
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Feb 2024 20:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709153312; cv=none; b=ehVYgEwQd3oPtf4l12l6W/qoMAyhZ07WIuwoWEdAUzVOjNqyfqOxOPAevYrL56xLW0dGXvuZFdTFfs2a870VvDywduEKFQXLWlmoj32uGzpxvipMAdUMVgLM7z9XzMHXcK66+5DlM+x05xDyH7yBlWCDe94yyWPKM7jv2hSPqS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709153312; c=relaxed/simple;
	bh=sc9lmdVdnWjzr9GXmsOHgqaQTFY20puZMxHYxFdT+V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiBrY1WSTa5aii2y5aT2KkCKU4c6bmb4jTS2Bqw2nC5VAILjuyDGdW/lk2wHJ1b2yCdVNezv3GiVFS8i1aaz4cIzKQfs5rUlsrUOdy4YSccFpLG/+IyTI/ZEnBVw0Uji56Lylezq0/GGJEu2LTRS/g4yArBO7SCgkihd0pW4ils=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWFvxLdq; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWFvxLdq"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so1671971fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 28 Feb 2024 12:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709153308; x=1709758108; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BmqUGFRY/SaPBZF7+G6xmjp7oKqZJPMre8oiME7ffw=;
        b=LWFvxLdqdDyJmr0pAdeAqm71q9QhFS0pw8Oes57hmF3QEP4oIH3B86QDI+4YsNlc/b
         Mt0jR4jtfoBSTgeYg5L9qgQ7r0Dsffz+s27XALuIuuYGwVy2hhlUp7UFoG1E3iWokZCg
         AmpI2nxQxcRCfRE3RlQAKOx0Wax/Zo2KLqwxeUq4IDPG5jOq2k99+6P3iy+jTHO3TNEb
         p5GjiU8W33RPFXt77JCwhHitAtAncTJbrXLFBtmdr9lh8csxu1k6KVGWRyk1FRF4NKVS
         Wby34VI54axEvHYuDOoAkio7UzbdQpT7BEJJfm9RuiV0J8VK2izh8l9iG8QijIVKite+
         LNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709153308; x=1709758108;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BmqUGFRY/SaPBZF7+G6xmjp7oKqZJPMre8oiME7ffw=;
        b=CqZ4bQ5vQksS92KIhvnB1RPtV1pVS7sXiuxg8BW0yvD/BT2HYmf9hg8DLJ2eF7tCi+
         VxAq5VlyNQadqiMh30H7PkEqyGtyW4AdO9w+3YX9VvtsWmp/L2aSjMtevUYOsKdDHDH0
         mUFzfYyHLwYyv2oUqCObwQ5qdgA7bwgsIxbxDSd3yRI9VyPTuLPpMEj2w/rFhx0ferOG
         vD15cAWztvByv2GoBBvb2fbfOUqsP2MBdx5sMEzfC3Pv8xgpQZ8WLBfCZPou5IRgP2rm
         D0gOwV7k3ujv66AzojeeEoWtnMmEKahBV/VkdbDSbOKDxHrgTvcg7emtvMMqhsvyHAkd
         U2AA==
X-Forwarded-Encrypted: i=1; AJvYcCV83CZ2eE6Sf1DHuHXxFtCoeZrM8GbjUjsfATGAg8qiGIminl/g3oXeSpODVWoOxk2N5n5lFNLGLmQs6ufYiLayZvnLwJH7UAwQY88=
X-Gm-Message-State: AOJu0YyXcQjz59U9I7b733dwPsSaog9CDD4Qqepn71N87muOliOI6hcP
	hzaRVvtRJHtsBgAUbLtv9hDfcPE467XU5oOVy35uknB6pJ6zohKb
X-Google-Smtp-Source: AGHT+IEp4+S8PJ3Iy3G8JacJ/zGYQqYRnXtYNKRVleZnT+aUT6/tQTfndsvknSO9gs11R6K4StiWhQ==
X-Received: by 2002:a2e:b81a:0:b0:2d2:2ddb:28c7 with SMTP id u26-20020a2eb81a000000b002d22ddb28c7mr11257ljo.26.1709153308004;
        Wed, 28 Feb 2024 12:48:28 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id m14-20020a2e870e000000b002d2a710f864sm36245lji.24.2024.02.28.12.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 12:48:27 -0800 (PST)
Date: Wed, 28 Feb 2024 23:46:12 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Ovidiu Panait <ovidiu.panait@windriver.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH] crypto: sun8i-ce - Fix use after free in unprepare.
Message-ID: <Zd-blOvXjU4_t8p9@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Ovidiu Panait <ovidiu.panait@windriver.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
References: <20240226215358.555234-1-andrej.skvortzov@gmail.com>
 <Zd76W98Ypq5uJmqm@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zd76W98Ypq5uJmqm@gondor.apana.org.au>

Hi Herbert,
On 24-02-28 17:18, Herbert Xu wrote:
> On Tue, Feb 27, 2024 at 12:53:57AM +0300, Andrey Skvortsov wrote:
> > sun8i_ce_cipher_unprepare should be called before
> > crypto_finalize_skcipher_request, because client callbacks may
> > immediately free memory, that isn't needed anymore. But it will be
> > used by unprepare after free. Before removing prepare/unprepare
> > callbacks it was handled by crypto engine in crypto_finalize_request.
> > 
> > Usually that results in a pointer dereference problem during a in
> > crypto selftest.
> >  Unable to handle kernel NULL pointer dereference at
> >                                       virtual address 0000000000000030
...
> > 
> > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> > Fixes: 4136212ab18e ("crypto: sun8i-ce - Remove prepare/unprepare request")
> > ---
> >  .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 34 +++++++++----------
> >  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> Patch applied.  Thanks.

You marked your rockchip fix for backport to stable releases.
  Cc: <stable@vger.kernel.org>

I think it makes sense to do the same for the sun8i-ce fix as well. 

-- 
Best regards,
Andrey Skvortsov
