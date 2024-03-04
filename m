Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4454917553
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Mar 2024 08:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709539663; cv=none; b=foiy3wFSb7TmsSz/y1UqqfPIjcgy1HlEawD5hCxlR6po0dS45bpF2vEdN9vcspJszFqe5mEPaW6ecEiBWinJrhW4Q15b/VVOhB7wyxr/vMUDLMv+pvADPuLNs0cnSrnzLS3pGe/QdgePkrKXt2yaln+5BdKTcmUMnICBfV9v1lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709539663; c=relaxed/simple;
	bh=JrEfQ5lsb+5XbsDuc82K+zIwkMVIR394kZZUVAvcIAE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Db8zOvaYYqJ5WnviafqyRT+cj5C+6Z7+Fwv+zaQuTKmUjSuQC1pB9Z2lm+18tTapvBcqorK0sKrNflvWIcEOPKO23xrUcrB2Vbm1V4nO1ZSBy+cvOxBr2FSM/OzKWqUrJcmQBQ/CS//agTxCP3G4PVF0cRbV6fh/x9+ipFVC5yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xleEMZOf; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xleEMZOf"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d5bfdd2366so2168481241.3
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Mar 2024 00:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709539661; x=1710144461; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I4V64q1EnS//uojIpdSXO9kfi0xqru4ymFKUT9EN5ZI=;
        b=xleEMZOf8jPaVVs5g2lcKc+Zzd4+YwNa4/DNqCe0YOOLessS2VcVHDMuYAE51cuv9D
         FtoZ8OBXZONMden9Y6lUp7rxO0aYocl2mTLk9nVMvVoavjL8xQdLRhZuzC43ql1J5NYl
         WxSH9CMybNWCnovlvQeZZibICsao+xdRooZGM7ZgJCITvEZnyoIoZzDjxBjgkJXWSF8I
         OUfJPFcVrn3ZAiBuo/DYVAXoFxxgQQ9Icu67I7+HLkT8DMsDQecWx481/ZdFHdzlIpRT
         MRK3ukyM+E3H6FHVFDe4PZAk2g7WSInZBzukUNQ3yecpsU+CCozTavePMShD5D+bVfNX
         MJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709539661; x=1710144461;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4V64q1EnS//uojIpdSXO9kfi0xqru4ymFKUT9EN5ZI=;
        b=FQlPHVnZzX0guPFSSLyVvgKQq61iXu45+bJLp7tbR0YYKHTca55uYwUC8T4t8d85EV
         mSw9zhtSlOiN4G/yIaGgojlARxU23K2s0g0R8FwoTfPYgrkMvgqmik57eNLUZeoVuh9Z
         vnV4TR7QIB+HyZZrPPKKZMTqnbUUG9BmstCNhnHEgG8yRYsJ0ZROCa8A3LYzDA8Q+Ep5
         ZRYAKGK1/w8JisWf33mV08zMmR+fzLd3cVMn5BjLxqM2OlZhUQ1XOuXfQiVg3k11/TM4
         Ai0epHrud2lSSqL1VHsWNRfIVm/hBaatLVFQUqmrIDzJtC5kBzPOBuLDwOrA5RgKDgPP
         bS4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvzDh0vnq+gse44P63MJyupna+fVGM9fQ0436nBILIMz8S+AOGB7lGd6xW46nI9esQqgic0YmOmR264Ana5juIMuzobQFNDZRoSuo=
X-Gm-Message-State: AOJu0YyaGdJiTMaqIP5Gf1iRyzQ6SBotg4ry6+Y57qyFZeVsbCKdujCY
	Ty8Oux3Y90C7d/RL9eCeBOVTrgFmYmdlUYQEVUkhpE6qYzEZilqbDYPU8lDVo6AgxtSgqrp9B1Q
	ndHJJBiL7OPJImbjJEZP6Ww5jCsaVrjBEE50ODw==
X-Google-Smtp-Source: AGHT+IGe/sEs/lbpDzYz9UckYPkNs1+8EFlDGUFzLUMP5Sy5o1K+biDa5g/KZP7WE5+fr/wSS0T9+F0Wwd8AmHuOlTA=
X-Received: by 2002:a67:f1d1:0:b0:472:7729:69b with SMTP id
 v17-20020a67f1d1000000b004727729069bmr5396096vsm.29.1709539660578; Mon, 04
 Mar 2024 00:07:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Mar 2024 13:37:29 +0530
Message-ID: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
Subject: arm: ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko]
 undefined!
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org
Cc: Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The arm defconfig builds failed on today's Linux next tag next-20240304.

Build log:
---------
ERROR: modpost: "__aeabi_uldivmod"
[drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!

Steps to reproduce:
  # tuxmake --runtime podman --target-arch arm --toolchain clang-17
--kconfig defconfig LLVM=1 LLVM_IAS=1

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22919744/suite/build/test/clang-17-defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22919744/suite/build/test/clang-17-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22919744/suite/build/test/clang-17-defconfig/details/


--
Linaro LKFT
https://lkft.linaro.org
