Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499281;
	b=Y2nHOD4ih+yn/F191RQuyQffaymXEz+b1D9LKGjsNeY6jyggWG/bMNCgU+AbWFH59oyJ
	 c/5cMDhoQhfmUDsWnfeoQIFay0utkqNsY2ixjKM+7zikARAygi5h1oDNLyVdq9fyKKAEG
	 YWLYaY4lNKHWWUjlVuNX4sv8/JbecxrSzMrjBPytjUd8oaLPkv440K15VMnuZBO7l73cA
	 LCFmbALM47wN8F504gHf6Nha8bbR9LK6dXg4OLshlfdFkuvHWz49CVX9+bkU+UBpbWR/7
	 LscOOyCUGvugBakjeaer1/EnCemwsX3RP4nvUTixiVL3evImy/fIDBDVwidS3D2w0dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=P0QwVqIkHLHAsRie0NBb7Fm4JU4R0zkfzukQ7suLbX0=;
	b=JaykcQLRwwJOTiemF9z1U/OeOIbegX7YWcp0Xfxo34Bc7NxNkRfHW6cxoM6ycwIgEF4r
	 9s03dmZ1X3cTyQxxwC3KmAK6DyQ5Sap6iY0rGwB70AvCf1e2u6RGina/hl4k4O6uaBEeB
	 qJpCUz21HW1fHWmxZhqtHYGVYeYc98CZGkSFvYFpOdB7SXidUeSEZVu5AHGmBZDYMTmtH
	 MRdHbP4BXnctkBJbEk62MkJ/hAqZBKGpJF5a2hwA95nPY4nCuTQS3MnVc4ObVl+LxYFH4
	 Mv89NHyHXARQuMfojUhNJu4DyJuZU9wz8WkguLs9pJ1ZKyIPVGf1lLJFGGPi6dPMPzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g5A8hhAa;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A593B606A325
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 12:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A593B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g5A8hhAa
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1948259c88.1
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499280; x=1793104080; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0QwVqIkHLHAsRie0NBb7Fm4JU4R0zkfzukQ7suLbX0=;
        b=g5A8hhAa/uzjB5HuDsSJVjFU5LtAJCMi4SDv9b34kse/LUFTcD2qJHq3VX8BcVW1kC
         ihyshLsBTfDTJb3ujml+JZHRYq9EaJsl1dI3TQUggAtdemDgXSChg1MwC/JKYc2oCgCL
         +RK7itlWdn3WX2kh3qNSeOrspq5QnBcddBpqcMaxIBF9gDErMpKjmVhmVelq9pGBH7Xp
         R/Y49Qt4PptREvALgm7man4ltHQB9VCuANnmgaWetBScw6feX/1iwTHBXXb8YODkyQh+
         pnYLUTHpTlGoasTdcKQuk8N5UjlaakJtx8N5uhyJrDoKhcGN8ibwy+kHK18cgR14SCF9
         mudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499280; x=1793104080;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0QwVqIkHLHAsRie0NBb7Fm4JU4R0zkfzukQ7suLbX0=;
        b=LbsgbY/elOYbKgmUzivKDXuZvcih1H6root14XU7GV6yX5O2Atqei2KyJ5rL+NlHNM
         nFRjHWgwPdPHXiYjNFBHwBhhvKmYz5C80ZAFecllLEqKUNHB2r1nXepJXC0gJsK7BuEP
         /f1EZhPjX+2WEtpEGJ5eS9ZlvXF6LwcdYL4dnfnxfC03qCCEiAllikhajTZryPafqa4U
         z/dllJAzJI6h32298EBO2f7dWEUTICWPfup/LCtv5G7FTUNtfIu6f5PwDEV7jT9BWakC
         OzJW1eUk8NyFN2QmnppaplLa4h5CkmA74/WdY0nh6Xz9QqHv/RQo3KSfkvF99gAtGbBT
         Mq2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwGxHZqshr0nv8m3K3OyknZGc9otTe8/sKvHX49xegEI0i5UQBb6yVfHBFL1nCpSr683DhI6/3DfK9lQw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKADCbLU6DbVSwGgBCE84SHR0uRk4nJgIAoqG9axG6bP0csHcMv
	a8/Y2Oh7TwbhTrbZC1kyXGLh/YJgiZ0GQwrDuhS0w8kBzunP//yFfBdW
X-Gm-Gg: AYBFou3qvUmDI4+k+aMATIk7S8u4ZjLsPjIYGD5JPbeUs5blPhRHCJgWrLWWRTJZfSo
	5i4cMrnV2vcNaHUDIF5VMKogqamdoy1fko7IQtonAIvTIaeWK2gdVj9xUil6SrbLjd301WYajy9
	f5YJ+/MdqNCtqJhcn08PvExeNNsceJy61sRnSepzCiDvZF4NMcZ9TTRz6NIiiqQrGMvEaFC4beL
	iIA/6vhofBKokiXWSC7rUyXKyppbH3M1enAF0aoUXe1dD0Y66GEL9Vmej3OR4r8MgLRvK8FJWWG
	1X2RO2DuDrJqEaZd/0Lm1ZiicdvtbYaMb5krnMhWxuEvjSA1bPJcL4ycVtsNLa7zxExWL/LmJ/C
	K5WZ4THnxumbq3IXbd9NEiS+A9yDrzhwKPC87sGfbJ7dL6cav9UgHibbpCZcm/aqUmOU1PK1WeH
	LvxFxnV+JxeciLpaWf3WEcvsf8mD9bt9YMvcTRWVPnz1LlcQ6JSVuc3pRo0fD//WuZCieZ7d84w
	3Pn0YPh2tKnZRwy9Jtm7cFF09Y+NzlK6+PxAiv/0hHTgCVgbcJpliyej6QZzsW+pfsXCrauWoke
	mdUpNQ==
X-Received: by 2002:a05:701b:4302:b0:165:1f2c:5c1b with SMTP id a92af1059eb24-1850d37060emr13962847c88.4.1792499279662;
        Tue, 20 Oct 2026 05:27:59 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm36015493c88.15.2026.10.20.05.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:27:59 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	andre.przywara@arm.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	enzo.adriano.code@gmail.com
Subject: Re: [PATCH v2 2/4] serial: 8250_dw: Only accept a contiguous DLF readback
Date: Tue, 20 Oct 2026 09:27:46 -0300
Message-ID: <20261020122746.41699-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <09812a6a-dd0d-9c47-e1ad-5220f1954648@linux.intel.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <a79114e72d029732db6764935dde12aa5d497706.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <d992e18d-31ab-4937-8780-9c9dc423082a@kernel.org> <atcm2zqDs1P_EDr0@ashevche-desk.local> <09812a6a-dd0d-9c47-e1ad-5220f1954648@linux.intel.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On Tue, 20 Oct 2026, Ilpo Järvinen wrote:

> For is_power_of_2(), 0 is not a power of two. And it also wouldn't make
> sense to have zero bits in the bit field as it's same as no bit field so
> using just is_power_of_2() should be enough.

I think the reg != 0 check still needs to stay here, since the test is
is_power_of_2(reg + 1), rather than is_power_of_2(reg).

For reg == 0, reg + 1 is 1, and is_power_of_2(1) is true. So without
the explicit reg check, a zero readback, meaning no DLF, would be
accepted as a valid DLF.

I'll keep it as:

    reg && is_power_of_2(reg + 1)

in v3.

Thanks,
Vinicius
