Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A454A3414
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Jul 2026 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045367; cv=none; b=LH5QvgUxBoVkDkGOqdi7XbTzNgcYiGexIkk2DjrI2EpZhyUoHTID21FUC4c89zia2tR9Ono0/uiJyzAWaPvordj79PMfGXqRJcbtNGV98bu7GZAEFuhKtiJG5jKqMlmNH2Li2k2INXdNgEQ809aXv0OOJ2e9PzKIRztqueAVgYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045367; c=relaxed/simple;
	bh=GXVI837g1ct10qWkXRLUJqSubRz9yvmaXF5e78qaF3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZpHLuBa9NM6jLW1ex//uADlYX7mJhufF30kYTka29Vj9WXKF2UP2dzKUoKp1tvrH40eCStk9bLFNX+6DIXEf6JOQ7gbol8qfF8NKlGFtD9f9galLIuH7Jcs7JkYnTpIL1KulZwb+LgImt6x3JeAU2yToe6jVuvGXf5OEsIBfkIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Frzmft0o; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Frzmft0o"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493ba701891so8962585e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Jul 2026 09:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784045362; x=1784650162; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXVI837g1ct10qWkXRLUJqSubRz9yvmaXF5e78qaF3k=;
        b=Frzmft0o+v7gztLMyH/mgMeAFeTTtnQJWAACN7Ov8tJFcoF8zyNCe23kL5QEH1+Mal
         drGkR+6Texxx66p3fMHx/vGomd3X+HtQ4eUF7Kmd/TJ4EUvVJ6m4RSRlK0BmGWKtlRpm
         SS+qQ/Ke59Yp2k0yaDlqawetwzwCmEmdj0iCI6X/bOhvAlCfjcSp7vgXaLj/PRlpgoSQ
         HQGaU3pV8/9Id6sHIIq3aQJcTW9Z4SJSvBI1tZwV5WQunQGAP0cL9zpZeuqg8RJv6Q5z
         TSG1nh6PUfraAFeX0QKituWjC2IQxmwpX6REwc0bNblsQuupt0vQntNcLfO6xfjr0gxN
         RnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784045362; x=1784650162;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXVI837g1ct10qWkXRLUJqSubRz9yvmaXF5e78qaF3k=;
        b=MnsBlG1BLsWbc+k9YWTPvZJZCnyyHxbPXG/dHIiY3bvqOUSbZ6DrOGNyyLMtmsuvN4
         DjYwzciMEQ1QAJYb+m45pEKoP5QPOiHvJYUmMpirtVVAqy0rF62Yyv8i5gMf5gkYFI0e
         ec9SDMDqAvrWnINGP3/18g1olSbpgAW2u7WCemwm/2QtVSOhQ3u61EbcbK8+fyLUPXCB
         qJqQlR3+sE7IsfOV4reBfd1LGk7KjcXgmLWQp1pokBXj2Sz7iYfRB25yd9bfXEMZWJcd
         1CDDlWwwfB14LZi51GBC78ApGVpEO6bF+WTVu3oJzq1Xn1fyAFk8K+5z3eM/3YyAf4yn
         weGg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8avGra6cIqfVUZdAOkZHhtw9GVFz120qkud4G/RndpsVNo4U2F1sd6rkmUon+gs9ugFsgJGevkhpxug==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtI9e4h8I07v6FnZn03mpic3pofWJ06DautjLJ8unA6C+m2yRT
	6ai81teRz7QNk8qsc2ktFcchNhoPb7F5PvLwHEFtHBWgNgRJNphW+1U2
X-Gm-Gg: AfdE7clWBaG5wMy6xkBUoPxtxF2JNPz6SVzUV8yltn0M9vEaTfnbycoyjDEdx3JWsn2
	b6Cj6bZwwtTAUySUC2DEPwMags2UbNLZEkseRoz7FmWubQId3kTzsMe3NelzbUtSVTP2g1xauty
	kqEM5BcARV7Jtw1Sit+7L7Job4OtnnChmhtE8vfJkOouy6H4KvNok28lOvwukJ4x5sEUTX6OPHG
	G8gvKOyHtBxR6QDkFud6ayWrm8RkMrLvDz7zl7VkMe9ObT3lloGjPmq5e6QDFzPoH/8Jrp/A5Q1
	JH2bqHKHCwoV6XhkDK25KlhSnOgc4LapIY1qeYeL35ZPI64kNViDjV3NrGjDiRd3Vxa9YwnwFC+
	KFc8irlpudkFMAYJZjCysfJhP0E7JKWJjrawjhnAd8UA9uzGQoCyffzgvxlp6br6CviolRxH8hm
	zpUqd7jpF+10dOfu2vf2MV3ehOxUk4T0j/gx3MBkdrRdOJkVM8pwNVGBoPs2IH27Bzqm1Pj52gm
	bXAOuOtJF1UiAVJ48Kdn2BIy1K7umWWNA9hXz/1qW376SrBCvNrwWLK+UJTbXNAkM+YI7Auht/w
	mJDtkdQvUku2ZTFhTbc3snZgDDa+F5XUfZpHWvwRaeA/RCsAF+o0Ic7az5xZFxRIt3xIfWV4nr4
	gJ2NFGTml0joiGrTND9esHn/q5BwEGNcw9nCJrcvO8YE=
X-Received: by 2002:a05:600c:3e19:b0:493:f28e:462a with SMTP id 5b1f17b1804b1-493f87e6ba2mr149120795e9.12.1784045361917;
        Tue, 14 Jul 2026 09:09:21 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-4-244.dynamic.telemach.net. [213.161.4.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2dd8376sm228065035e9.2.2026.07.14.09.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:09:21 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sun4i-codec: Sort sound related #include statements
Date: Tue, 14 Jul 2026 18:09:20 +0200
Message-ID: <ptJh_8TPQY2jXW7OWRlEFA@gmail.com>
In-Reply-To: <20260714151950.316035-1-wens@kernel.org>
References: <20260714151950.316035-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 14. julij 2026 ob 17:19:49 Srednjeevropski poletni =C4=8Das je C=
hen-Yu Tsai napisal(a):
> Some of the sound related #include statements are not ordered in
> alphabetic order.
>=20
> Sort them. This results in no functional change.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


