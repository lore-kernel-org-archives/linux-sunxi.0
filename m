Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF0413D8BF
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 22:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491546; cv=none; b=eCleYVVXbQUrEcNrjwn7qeNM+eoWDWjres2fCHwf8kMObONpyDJLdXMV+ZbAVUaPocgD1qR+4YehA65GCrlRFfaSDhCtaloBPzINZUIenf7DrJyf87oOEnZSuQ55/dPkPoLw8at7RpjYZhzn6+B2OIFFIAi2YC95o+KVpf2lWcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491546; c=relaxed/simple;
	bh=9zMGqulRLmq3vqj01LsBRA0A8CYYbMWKFHP8jPtDCik=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAMmikcZFPlMOyeRL21/vlviV/HhYn3dRtf1AevCJFvlJiWHKT5mJJy+bJN8pZfNeUZmYXcU8o6oEAJm3DlMgpBzV6lWn4ilv5ThBrPa2OvNtUEo5Ps7YAHnHyY0AKxlc9Th6GqgWFnrQV89L4utLz1fNDYYJYLxZ4wapoX/+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGUegX9V; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGUegX9V"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56c36c67deaso588676a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 15:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711491543; x=1712096343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyCLj1OUpWkQyfhuJXsbD10TSivodqh5GvYGLmhlJI4=;
        b=VGUegX9V/+xG7PZNTbimRKhd7fXK0yL8xBQIDRs7vRKlZkDk+R9rllXyUsS0Lxec7e
         JDghOZE90qji72drwN6E0W9y5tk+dir9v6FpFdyX6B54tAQLCKsQ3WVjhgB7NNw+Advy
         fJs5FiTYcvNrJBFZcpViULEpeiK0Z9woWQDnkcOJChHxno1mYj3P30ROQ4pvZpB5Ip7t
         9MQsVKy5svRMbsVU2r88EPJcb+KMFSHGCUgTtavl5VAeAnuWIK4Cc4ZKJrO100thq8GS
         yO9hVs571eLsSHfGkbgfX2TwR0rvZEG2lXfQRq//TVcgwSxMAXgevCG97rYGoJgLDLl5
         zlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711491543; x=1712096343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyCLj1OUpWkQyfhuJXsbD10TSivodqh5GvYGLmhlJI4=;
        b=sUbULRpxNQDKFZ3jqD0o1FnQkthCKpmQhM9/jfGniY0HUteDDB2GDhHNE+YyZTji+p
         NfAZll07CxAy/J0lj03exnzgf81ggJG0cyuWQCr8AFX4qM0iJiYIbmjnIXpfA7ttdXWi
         3OegPTT1F4NqsCTevXQsSlcaB8lhb0KMGbk+T/qctbbe7vzHuBHFLAmLY8yJI7aGI1Aj
         2jpe0reChhNaPqrumP+4shGfd7c1HuOPGSgtguQZ3GbzP71x9lXT8nojTJlGLp8FgCp4
         ywpBOaZJ0jVDdYAwoCHdTMoYaz8VCuXSEA3Hbq/RqU/HzV6wo/0Pb7AA1t9N2Qp6a4Hp
         XrPg==
X-Forwarded-Encrypted: i=1; AJvYcCW+yjeewuQXjx4uPop6eo58Tu5mDHZHi0GkKsS9uJ8m3VoG1Yt+vOpCZvaA9I3mZWLlJTBFWT42wgpOO2Sf2hxpGGA52xX663VughM=
X-Gm-Message-State: AOJu0YxIOAs5klWuDAUxTmBcIp84xxqv9Nklk9n4XBGxv63YrVZVzUrK
	/l7t6rj7SzIx4FzZzkO/7tF/qQVOa4NlWLJVVI6skn3v2j2A8J8R
X-Google-Smtp-Source: AGHT+IGXf7T1vMLhzW/KEzN/Dqw4wUjeLLwxv4WedhqYn6D3+5Ku5/xi/MqHxQy4P57dEpI+PhWewQ==
X-Received: by 2002:a17:907:78c5:b0:a46:a7d8:3f7e with SMTP id kv5-20020a17090778c500b00a46a7d83f7emr6492795ejc.2.1711491543176;
        Tue, 26 Mar 2024 15:19:03 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id fw10-20020a170906c94a00b00a4dba9b98c7sm1465435ejb.66.2024.03.26.15.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 15:19:02 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Corentin Labbe <clabbe@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH 3/4] arm64: dts: allwinner: Orange Pi: delete node by phandle
Date: Tue, 26 Mar 2024 23:19:01 +0100
Message-ID: <4905229.31r3eYUQgx@jernej-laptop>
In-Reply-To: <41dcd736-5e58-4b71-ba82-961cd2863a62@linaro.org>
References:
 <20240317184130.157695-1-krzysztof.kozlowski@linaro.org>
 <20240317184130.157695-3-krzysztof.kozlowski@linaro.org>
 <41dcd736-5e58-4b71-ba82-961cd2863a62@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 17. marec 2024 ob 19:42:51 CET je Krzysztof Kozlowski napisal(a):
> On 17/03/2024 19:41, Krzysztof Kozlowski wrote:
> > Delete node via phandle, not via full node path, to avoid easy mistakes
> > - if original node name changes, such deletion would be ineffective and
> > not reported by the dtc as error.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-r1.dts | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> 
> Eh, copy-paste, the subject prefix should be "ARM:".

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

I can fix it when applying.

Best regards,
Jernej

> 
> Best regards,
> Krzysztof
> 
> 




