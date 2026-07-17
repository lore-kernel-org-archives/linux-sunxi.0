Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF36332909
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 02:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256218; cv=pass; b=AIy62vEPpxB92qAf/ScvwWs0EgILsijfEAB37imoYJwApYhHk9zWMsUm39HqgpVSXBPqh4LRUh87eZkpWs5RRQ7XP07jQujeLfPZNbbCHap0MCrF16KE07zaylif1UfPrYK3EPxUb390BaE0GNDvoB2iAqRXjYqfWzPGoh+Xj5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256218; c=relaxed/simple;
	bh=2Fzo3M7LuDytk0ZJbhSffN1E7aCbsqWRH2lDInDjLQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osFGCvKfWADMZJ5e0K5aDb3lWRM7l7ZIXud3nuPGcddeNBHoaxCKTQS5ZfgeNpQ9ZmFsckQuShOkndLmnLq1cKAPuWV97LmPlLDeJwvXTNOCza5VNXjHlus3HTs5npemOB4GqpzRiyxFf2qxu/iLNd07jZGmeFOsgrhHal1LJbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEcIoRAy; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEcIoRAy"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso4328486a12.1
        for <linux-sunxi@lists.linux.dev>; Thu, 16 Jul 2026 19:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784256216; cv=none;
        d=google.com; s=arc-20260327;
        b=qCh5AHD0x6BI12VXQTDYCPWCzTLydHkWBkBPa53JHk0ZpOK/0dOHl5dhEGDiULtEOi
         rlKE6qg8zuGUuNJDoTs7MC5f7g/4m+TqrzAnoTcvEbou6eN8nriNE2j0X4TYJ/U7JPLh
         t2RGn6B7iIwifOpKIcJHftOA0B/dKG5IkqBguZdIGVxZwvRbL8tH4tfXHtUYpowPVC+E
         Fds03do1EO1RpABm6K16S78R+inK9W7JWQgVo0bJAQp2R6mliJLf6BbPvc7w8r+Tm4xY
         dp1iDeJTLwdTsa/cTC4erTUMFHZAS1fNF1KNWY58kqYyr/frkXFtJCk1CFXikM6zn4jt
         PjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a6ZTvlGa1jAX6x6nu+mWtSYvum03unbr5qRkIHCRmmA=;
        fh=EOw+T+xu9Uusr1ZR9D80v01PCzHnTFY/Fbl25rhoRVk=;
        b=VjunCKcPEqteKVIOkoj5W5ZmBkNTYUFPlkYG2bA+HryftS1WXHdJu83fQndxXkk6le
         O5rSOpTl2R82vrHQQ+9wBxUDRN8ZFw7qMs7txWRSL4760bwWI6JMAjUvcTp1+3e6pLGy
         Mjgj9Q5eaWRvy/8T+2YyChumVQxn5req5PiQPd3G0Q1j4fD68o+D2XFlUayv6OIObpYa
         8u81DgKIfRqfppkn0s+IAZNDYY3enyXig/omIu/6S01rj4JjKCuT3rKi6WuMuWcgUkei
         9ICpr2yjoxqWl5bvXeQhWuMXQsCjlSmM7OIRhQnpFM1xUtbablUpf6jQjty1gaVUfzfN
         DAXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784256216; x=1784861016; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6ZTvlGa1jAX6x6nu+mWtSYvum03unbr5qRkIHCRmmA=;
        b=tEcIoRAy+fwxxVlUdcshj+hH2L3lTTQd252lV8cy+r5/axU3syjXZbOktSlBxnbEsg
         BQ0CeIsX27Ps/Ie+dE5j3J+o0zEpfio/haw+wa/IMnGPRg/07GlKMXOhuivB0C7ZycyS
         JTT4ADTku0VZ/7XNx4Ds8lMcitsXdmoJlhNlGTdcHIsuFvIv7qoKO+VMQ0Oj6Mt+md6s
         ClM+DB2v7v/rn/4kWA3A4J5IFCeqG4ZCx8ivqGbaPTzULXosBG+CcC2qJN9GaFnEquuR
         77NOCmmQuRqcoUBptST85BB7RNRS5Jk+pzqUxE6kukjomTuvsE5Ghel3LEjJLrvt73R5
         WSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256216; x=1784861016;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a6ZTvlGa1jAX6x6nu+mWtSYvum03unbr5qRkIHCRmmA=;
        b=P5gVkwxcUEIYqsQJWHNtKy4MZBffC6galWMh5m+7Cn1HtkhG6AgO3r8RYbgd/jwbTO
         UDImIUWX8cZkNISlmZQzFm7BIQ4AjPjTcGH4XlOfd6hVueUgKs6id6NkIBJWf+8lah1x
         Xq1IivtKYGAVbE7FnbQDyr4+Rf5dqQJVt3m5qD/CilT5TiJTkpjrxAt7KtpeUT5QTu8o
         YSt9YIgCFK6q403hiTh+/+vvAE/bg3nDTRIPkXCQUNnAd/bI+0wB9ldZfC9pfGmBkhnb
         rDkbkYYUcNAIwtFUJ0YwhanUMaosraSwf4arDdChnHbE1QXkiMAsGSmIqtaiVlVRJ+y7
         yv+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrvoIC+n3SOZKFZU0PBFfra9xKS61dL+dehqn22r47lMbGt2yhbpN1zAtAAm1kFTymBI8ANftbdTVGceA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTbTY4YD/K5AT4DXQGQ7h3OxKjlg8sqsCk2FOFYKq/crYYvtd8
	TOBSAs+lzDZD7OZOPhIkw/SKQDk1MRF+ocFTrVS1yqLUKOn+p00OdcdVeiIAkqPqM71YySMPC89
	+/0esdnF8/ccGi3UcZVFmBPX+oGDh/pc=
X-Gm-Gg: AfdE7clvL5HMt2ba0NFpFY0DlwehWnk+KceHqtDwckRIeRPm5hQr5JOoC47VoekW7Ws
	srNLdtoqCMNrtv28ayHsO7KzkXMAnmp931JN5eQzyA2PBs/IBr2tB217F2HQJfswpk9IqSSijw4
	8WYHKacVdjXDbohm+mLPFdZiroLzAq+bhps/FtPM/2FARkqWv3RErZrJPw4ngI9edfqga7WMIKK
	4sJgPG8f0tNU2cVhb9wKVZsVzBON1uCEglfwgSDB6JieAoHCx5w+I1V9yc3EmHinY1tx+e3EKkg
	qFBQgNTWL0l1R40qr8pXFgC9xAa2eQITassyZ4ugf7S8ibfwdtk=
X-Received: by 2002:a05:6a00:8c2:b0:848:54e0:96c1 with SMTP id
 d2e1a72fcca58-84c29590547mr541291b3a.77.1784256216411; Thu, 16 Jul 2026
 19:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-3-phucduc.bui@gmail.com>
 <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com> <CAABR9nEk19N-hBm+QKv6U=7SBgkQwC2Ohb_NDz8OLEetavLLAQ@mail.gmail.com>
In-Reply-To: <CAABR9nEk19N-hBm+QKv6U=7SBgkQwC2Ohb_NDz8OLEetavLLAQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Jul 2026 09:43:24 +0700
X-Gm-Features: AUfX_my9M2Eo3gIu3CtbO4S8ow-xrYGE6kyiiiETHDgngv6Z4-cu_CPDtHYWoKs
Message-ID: <CAABR9nG2vYKhMKeSxFstCRcHb8Z2FzDTBuQ3PY261Lipx7FfJw@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
To: wens@kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

Actually, following our discussion about dma_request_chan() not always
printing error logs internally, I did some further investigation into
the code paths and have submitted two patches to address the underlying
issues more comprehensively:

1. A patch for dma_request_chan() itself to prevent potential NULL pointer
   dereferences on invalid arguments:
   https://lore.kernel.org/all/20260716052758.23465-1-phucduc.bui@gmail.com/

2. A patch to improve the error handling flow inside
   dmaengine_pcm_request_chan_of() when calling dma_request_chan():
   https://lore.kernel.org/all/20260716080428.57979-1-phucduc.bui@gmail.com/

I wanted to share this here to provide more context on the proposed changes to
these DMA engine error-handling flows.

Best regards,
Phuc
