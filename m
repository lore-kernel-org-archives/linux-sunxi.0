Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743822;
	b=A9d16BrHBcL3GapUnhOOIUHDA2m3ZIpk/V7yb4ZnCWakdtoNByFFTdbFnfYxiNdcTEpU
	 4VunhQJNC7IjLA7xnFzejKWRnpPtD7G/O2SzFM9P6RzBv0YfIgDoFRqymq6ZvU4Q0NMso
	 YbqXwObDdIXi0tNm0PygnrB/GPuydQJ/TKvONwQYaBjHE/coZOH9YjS8qb8Up7AIlCnAF
	 G/Fl432JhueuGDIrix82JjWe2RXhkr8nxw1YXVsjsrKSQDD1rrRCynUWd/zaS+gZoWLAA
	 kEETP0oIWbepBqX4spLpbYvqDeQU5oiFqwyIGv6tdJMIOcqqr2TrEnwZY3x+8FxvY9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
	b=dJ+oribHsN50cdGY+fqw+mCMhMZIQX/pPijfrm+Wjqn4Z7bqwJ9UBbXBi56uHNusqbPc
	 Mp8q1Q5DM2wfBs3szqC8mMdaX8VAwNZR9sdIiA0kJBZodm5XTcMFLcSRqJBc3st4PDV1X
	 K2Ch7RoQ7bfYSIYiwnOPlNAPXk3xlBxQ1uiQHKqGDNQ27OledsC8cB04cjyvmUBXwrwt1
	 psUVt1oJGzy+FuCo+tkXBoO44wR17ILOYOjpEhS9R4BTT8q1v/JtBx+Da6XWB/EQeIoQd
	 owMj6EFQZ2xi/zURqq/RZrTQ8EK50Ts+ejgqJ+OCObLTZRZ5J7SCc5PTZVHckV45Ufw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5bWiibG;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D23606A321
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 01:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D23606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5bWiibG
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so49465175e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795743820; x=1796348620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
        b=d5bWiibGmo9NGQLhysaAR6myQGK19cpWa/lnK1fOsiyFW9QOE1egWCX6odLYPVR0T1
         O8F7wr2B14x4fsAvMGLdX2SlJHFnpj7qc6rKh6hCprT0BdhT4GC4uPnakMerBlunZqq0
         6ZVjs+kX+Fuf+55lkaRNJeRF+OSJ94lte+WQlcFqqEKOy/TGK2aeZlqyUfHi5O9RGa/x
         5lka7D1NSLRgf9gNUjK2J6j0lZSTAJV48jo3YrSv6lrMynnzFoZvzL4NbBUHeaYWsm8V
         snijocyoAkxPODhjX2t+jb+C2liqigQE3MWV6kuDiSQQPejhPDqFi4uuhMfiIEZpYFN0
         Bl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795743820; x=1796348620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
        b=jpvzfyM/QP4EEMAB153zLO2j71dpvXmw8cvUggXtr9krE2368Mx5Fyb5Kd+oanKmVt
         903mEGExgjJdK3WBcj8LwnRXFxgejk039JCeGbeyLS3PmnxjsgPB3JV1wmpZpSUv4yX1
         /6bh7Y8bKQC/cQu6Yzpsa8ZlLOoN/bu1seLV73zvMtr/D/r8+UT8I1ljc38DLhNyM6eQ
         85Vy60BPVlelH+hGvSyRnV9/7h459zcxFtTsiWSyYK3r0AiAJrp26t9k9eGLpwQNLos2
         3lqRnWSJQlUdCTgi7mm4XzurhNgj1U+lTVmt0Rj7Kn04kOsqk/TndEz8h7ce4IEBnXN4
         mUOA==
X-Forwarded-Encrypted: i=1; AL+hErFbtoQNds0s0tz2ARCDyBtehQtpSJj82qLTx9qNCsqc+juz6J6npU6tyovKDrVSUWWstruGfXfXnTD7vg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+yVAM+UE4PG36ekSx3YXNxPQ1P0LB+qxrmPxMSjU44M1su7jTE
	UWCRsjVNdiSaSJ4S2pp35EZMjXt+xSYiLqRWUzgHutoo0BUlgdmpFsrz
X-Gm-Gg: AZFdTZeQpfmbHDFJ6emcFYQsCtrpjyyWl8jC5WU4wx+9LjJ3kbKhuxODk+FdcW46Odi
	bZpH+aNy6NfGzxWuf1DEWuafNEVKAjX5CLKljo2bzts1A7UXJto9ceikQd94v8GB5Iz7qrQv6KY
	NFakXFqUGZ0MlTo4rsK1iybkwDjBz2K0STsxYcptRhn7oEU4hw1bNErklv/ldedvdSvh/ft4H3L
	KiYh226OExqgm5nV7hDmIwu2TH+KM9Biqs51HZCb98GxikennUCz35ZzLVrUnFQX8JfoLUZAd2X
	NqVvkkG1N4OKTYbjIF1ru/mIXIwzrfHPKh1JxJN+zF9FTzGaeOx7sfEKvkC3h1Ac/Xd1zVMvusl
	nR93x0dbYeuLDPpzb4rZco6XMS6zL+0nHdFx2RA0zBwtv9fWj77y5foG2tcGlaxyn3EmvDZoZba
	Mdxea5fyvnOvhaCiUK1R/Jg1C+xKi62XHsUX46Gz+07T5SOuXSGURhlSdyF61q+8IfbjpDYwzC6
	6OVd97FBvX8jZTOCL+lynkXYrUtEifFRi6XDzv2X254ltCOImvCw/6AyrLO6cXqSq/oG8MDcUQj
	jxd9KYBtX9z7vmufq/obs32cxB8esJ7l/Jgn7ePGHTfFDPv0nGfVNXKAqHVnHNjWSTl2CPFb4wd
	f9oviL4JQLWx9Vr32eZWpaELO2w7iZu7XVNNwhwof3X6rjA==
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr521380065e9.13.1795743820179;
        Thu, 26 Nov 2026 17:43:40 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm385176475e9.5.2026.11.26.17.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:43:39 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion control
Date: Fri, 27 Nov 2026 02:43:39 +0100
Message-ID: <20261127014339.1611234-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179476597358.140154.17606905713832103924.b4-review@b4>
References: <179476597358.140154.17606905713832103924.b4-review@b4>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Nov 15, 2026 at 06:06:13PM +0000, Mark Brown wrote:
> What about the configuration with both set simultaneously, so HPL = L-R
> and HPR = R-L - that's fairly standard with an actual mono signal (ie,
> one channel as opposed to two copies of the mono signal), doubling the
> signal over the speaker?

I tried it on the PocketGo S30 (speaker amplifier bridged across HPL and
HPR), 7.3.1, plain stereo path (AIF1 DA0 "Stereo", headphone source
DAC). Bits 1:0 of PAEN_HP_CTRL set while playing a tone on both channels
and another on the left channel only:

  bits 1:0     both channels    left channel only
  00           normal           normal
  10           louder           silent
  01           loud             loud
  11           silent           silent

With both bits set the speaker only gives a few clicks, for the
one-channel signal too, so on this codec it does not give HPL = L-R,
HPR = R-L. It does no harm either, so there is no reason for the driver
to forbid it: v2 will expose the two bits as independent switches
instead of the enum, and the S30 turns on only the left to right one.

Thanks,
Romain
