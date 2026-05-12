Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7EB28C035
	for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 17:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607622; cv=none; b=WwzIFoGbHcZObJGRVg/cZeVbYIJmN6440niQdMi1JIknntHNCXqFBd2GvTKfGTlaNDnA140wRVYuwOvN2WhlL5XbocD4jEpG9RyAFJGIKYUt6+qXekZcO3ft1oFmpjjYH6c4DFCNiDfwnqIpzCL7Cu97AJTuOSmkImGVK129RzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607622; c=relaxed/simple;
	bh=knJpJ9VnlBSkSPAk7OAn0fgMKl1pyt4vtEsgbejeZLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NTdrn72X+l7SVzIEqpulxx29NsOBwhHrygN5/DTAzlFWnjIIyP/ogTEg5oAWRpMPa3Z79UEnBq4pPsIn4HLkSd057/Vm7bT9h6B9BansuwQJqgRCiV6uD2jz0j77PlkzWBFPMfWbcgbM/lvhIt04OeEG63fdC2l2Zm7jfnmxz7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdEqo2EU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdEqo2EU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso65654695e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 10:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778607619; x=1779212419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knJpJ9VnlBSkSPAk7OAn0fgMKl1pyt4vtEsgbejeZLY=;
        b=NdEqo2EUQ5Y/+KUDxHSD1icSvbbDnst1+cstd+n815r81IhZSny4otgW57QOhCaK11
         RU3HEyHWUrxt7JcGVUlW2f18R2jfyup5YyoC5+8uTBV6ckgVGGB3vlyd7rHbUm6Pka9q
         FLVbz67eu8792r9y4MveZilWYO/NDhSNVU4VWbwd91Qjg/e6MFUOE38ZAkW/Oxy17A2K
         mbWkLI7PkxLQUBofbk7UNjAAjdNLNaLE3Gad/JvLGGGTYSRt5TP2lVOi7C1ZA0G0Y0su
         lBBk8b8/cPv07XiAOMv7WGhFgB69d9eupj3NgRGpMwSZ9pz+tN0OcFaVQSYXlmGwZrRM
         gvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778607619; x=1779212419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=knJpJ9VnlBSkSPAk7OAn0fgMKl1pyt4vtEsgbejeZLY=;
        b=YUbDWxYCebVB00E9qGwy+fj42vIn+OZOZNlLCMAGmThTypWpOxeeZQG9Pl2BajOHWr
         JMKiCPsItqPZeDwFTqCAyhh6NAoW+f0EtcAbMKi7OGDP5qYDhdK3Cfp6P4Cm5w5z9jeU
         ZBAEeRalXidldG/udUhCoa88nG8Bm5HP5uVspyuAaS9jRa03Vtaaexgfq83pstIe01Ik
         cIrNgO6IneswXuzWqLT28t6wWE8kbDo4C4G+AdF2WwyY/9i+15i1xIWC0MOLDkOGyp81
         Lkgyw/NSrkkfUBEtNwDcZmOgImF8kVRJNK/cyrO98xrqqI2VnKbs3ZJPtzdjcYl/ZcWQ
         njNA==
X-Forwarded-Encrypted: i=1; AFNElJ/qVlAoB4qIhiEXLlRVNcYaOlh0DGoa+napwA7HBOsUmwrt4xwWXEKN75He3B1p5dYg/FAHBz6FJbulIg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfjosq3R8uEKmfXR1nHtSnZSQcPbcAzbe19A4nv+0Bj64/DrF1
	KPjcDHVlfHOrI+n0O5A1jOMDqWdSQbAx3Sjhc+5CbcfGcgE1sFWCY9dR
X-Gm-Gg: Acq92OESA8oUKbBMJp+Vz5UjELrFQmKCS6hjdl6gfj6/Du7gVKCnmYjzVgbEFpUG+iY
	D16sJgvnIzPHacF5eZsQkOg7Ono+qLvWwvUtgegenJgFd5zCrVMulqv6A/YmCHfh0IWMOHS7kpM
	91ue5D5l56E6/zp6oZ2nAOOntKp1DO73diQSyAdEkpdoa6ddfhZ4TJiiVRCbUxyjC7ydSi2Sqnr
	p3WQSZW0CJkfqJ81rxynYj7Fk0yN8kPJv/Gs3M6QNoY23QVnLsySGAwke9iefjGahAi4y/duNn3
	7Gty6Eu6gApcTMBcPVC8y8aCQgn0G7F9nq5N3tb6RN4622ebV0mXfDpQ/CnnU2kmEDxt69P6wLF
	AvsHShkG4jWSqJD/objU2GEsyTQgdsGnwFuszVMnH9xlFf/g6kgnN6Nz9LEXhswhnCt/MmO+M/u
	Sw0I5GZZzxJSiFYLGTNHFmqW7v+Eom96hwxT3t9e6Vo/gy0FPufhQOypnru/hBSKOeiSSY/teG0
	X0s8lIe
X-Received: by 2002:a05:600c:a11b:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48fc971efb4mr440475e9.3.1778607619049;
        Tue, 12 May 2026 10:40:19 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d1f6dbsm12514895e9.6.2026.05.12.10.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:40:18 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Chen-Yu Tsai <wens@kernel.org>,
 Paul Kocialkowski <contact@paulk.fr>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/5] sunxi: configs: Radxa Cubie A5E: enable SPI
Date: Tue, 12 May 2026 19:40:17 +0200
Message-ID: <KHzalpykRXatGs1oStBoCg@gmail.com>
In-Reply-To: <20260511213713.15943-5-andre.przywara@arm.com>
References:
 <20260511213713.15943-1-andre.przywara@arm.com>
 <20260511213713.15943-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. maj 2026 ob 23:37:12 Srednjeevropski poletni =C4=8Das j=
e Andre Przywara napisal(a):
> The Radxa Cubie A5E ships with SPI NOR flash, so enable the SPI and
> flash drivers, also the SPL version, for SPI booting.
>=20
> Sync the defconfig file with the version from savedefconfig on the way.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


