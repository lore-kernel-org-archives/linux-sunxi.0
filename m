Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720961D5AA7
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 18:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161872; cv=none; b=HDPfRXJfqO8SHK1bkBeQHHjErHd9YSBTei10FJeDrRQkTOfXnsnptzBWAoArcJHhdLYZYhnrv8/Lmvsyk6AvXf1zgneHsjX/y5C2CcjSKLLKDOo5HLM1PlvydLRR/TFVSDxdJ7WDL7N1x3RsU4VS8umFEt5MivGvQL2xjP/zHs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161872; c=relaxed/simple;
	bh=U1W17n2j1LxEWs4Y4W56XmMTe4fnObSaTHj7aF3YLUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q3shLX8UjNHvFNlM61bJo7D9s9vswha7ZQ9WgQZPILN3yVw0cfA1p2Oaj/17GG/7evK8izB8Eu3YO2wV481kuMDpaZE8PWQoJkZnTRfmDsI6a5LXxlDU2nX6X8jgN9ZGhOdwA9cmL/4dEwgEvrbra65dP4eHKS0xVZcHAZ85vF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8IgtqRt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8IgtqRt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f378498b0so1986052f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 10:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740161869; x=1740766669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1W17n2j1LxEWs4Y4W56XmMTe4fnObSaTHj7aF3YLUY=;
        b=k8IgtqRtv5zTlRMDFwQ/+F3EOLrZbjEOCT9LIcVJWBCmRMTlZEfhQ1HfyDli9cScv7
         87tXYV28+i7x7/3jHDIE3pOgO0EQpkHsCXYL1aVxCjhVwKsX+8OyJ8A60On09JSSPO5F
         FUeINJQ91dI/1twAgtzHKcI6/ep5B2cVJtcE8qt2xLCR5gETWadQFYQ2cAQgPaqMlZ/W
         QyA/AZI6Ry82OugWvdwS0INqpKmaf9ROTPeVxkXNy86tjKo/iQnNEJ45aWeFejvpTRa9
         6i3PKoSAadm9kmIUD8kZWaHLTTSinq3z7MYTMQf4Famxs0wG3pHCdSdAxfOlPrVDQC1x
         GuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740161869; x=1740766669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1W17n2j1LxEWs4Y4W56XmMTe4fnObSaTHj7aF3YLUY=;
        b=tTp+oHnMoC3I+F1MQavTj8zSRjdBVOkIOxPjetTkj890t1cfsvPuZflq7oI4P5Bsjw
         +iN7BUTsYJwS7X2XvWuR0iFyasmD9vX2M8+THGWVTbDNL0AhncK7PEIJrg5xY58MHJhP
         utp+g6oZgq0oYKPDR9Lihs/t0op3II1yVhGyS9RB1VUldlpTn/hrzdUsynxDoXCedqUc
         tF7JDpUQKIPOPIMm0980vvEN/pjunewJL/Sru53gf/VhXLTFDGbc+BJvjkMs/58Mogwu
         HWRNFNlwMlkeRU/yrIOGjGNcqoipN3Sn9gB4vs3Ykvx8+SA3P1jE8CSbHIj94YRCbblT
         84vA==
X-Gm-Message-State: AOJu0YxcUCpChSVonDv35uqUv/owvX25XKF5AkwyM8KSj1dLncPvuYFx
	SG2VXlFD+PgqEJ1OEc8Q/4ltxxZHG8n/SzkMNgKCklqSZRW0DI+u7UpFMBNqKMw=
X-Gm-Gg: ASbGncv130Mx8TCEy+t3wyCGQ/g76OiaDeQYkaS6u6dT6lhhIOjS2TBJTD7lKXuAIC0
	BhD2Xyb7D5UokSmsm5A6FGP4d/oK6lMZq0VBs6iEA6OLhrOKPFxS1GVo+EuVO8PIN+9D6wS3GMi
	4Elci0AzVEg56nXg+wsERXjOGcO2mSipVbk5zdNa8SWHH2F8sB2Rr7qik6ihDeKMG46jD1koKjf
	IGd/psHSOMl3xauvNBpyu6eHj5j7nHhQOBfskFX3lzcVR81jjos63pts7BXnM04YYUZ/6r6qywU
	61m84rPd7xVCkDisXa0G/tJhBTh2CodUbvNoVH+WWO/oEhBhqKeEgJUt1kyse7gfvCe4nZxi20S
	Alg==
X-Google-Smtp-Source: AGHT+IGALAtK0qhzwHjSpW0g95HnjvEvJPGyQ0Ey4mOVtgunT7qzZCNsspeeesB5+gBG16CVVLhPtQ==
X-Received: by 2002:a5d:6c69:0:b0:38f:231a:635e with SMTP id ffacd0b85a97d-38f6eb6e4bamr4302293f8f.25.1740161868722;
        Fri, 21 Feb 2025 10:17:48 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02e425esm24683075e9.17.2025.02.21.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:17:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, lee@kernel.org,
 samuel@sholland.org, wens@csie.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, sre@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject:
 Re: [PATCH V2 4/4] arm64: dts: allwinner: rg35xx: Add no-thermistor property
 for battery
Date: Fri, 21 Feb 2025 19:17:47 +0100
Message-ID: <3335250.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20250204155835.161973-5-macroalpha82@gmail.com>
References:
 <20250204155835.161973-1-macroalpha82@gmail.com>
 <20250204155835.161973-5-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 4. februar 2025 ob 16:58:34 Srednjeevropski standardni =C4=8Das =
je Chris Morgan napisal(a):
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add the property of x-powers,no-thermistor for the battery of the
> Anbernic RG35XX series of H700 devices.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



