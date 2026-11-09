Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224779;
	b=SzNzndLuRYFxOp3zNvSzgTv0Cp3cijQoWRY9eiVcpYyEl2kO69ZezSXSLjOCoORJ3D/P
	 Oo0h1CKSToUdblwyBBswcwva5W0x3tFvHDbr+0Q/Qk2eJG+c0JNjAL8oh6wal7jQhslPM
	 kNEp4lkASXMrSOVcnGdXdhRS0rxpSXYtVYMSM3gDY5+PXPR/B5K9JUP4N66pHBooUQUwH
	 prhPkVFLxLlTls8ZHpwuYdAAUpDmaVk6yhARJUYwBqKptI59V3Mzi+rvu9dt5BMGaO/lp
	 r99z3vy6VyqXMdURz9hO5Cqw3v1lLBEkKHPZjukfNnYIfhjjWQ5OcvMPbMH8h2cE35g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UN7JSZ1+lhUpIQDrzhvOzINty1yZVzqD70nrLYHDV5E=;
	b=ZTgf4othZclVUt7QTz9y7A87h9Y1BIBFdbgAL+iQRj6UOzXHWTVMxMPVflzjXr0tdv0z
	 smigSP7BtzEU12cWLIOkmwCVoozeqZ1h7Noy78kKSbYukqHrl7a80WQfuYzOrZF3Vz3tc
	 8iQ0pLG0yiP2TRCIonCXcWWEAOjWt1x0ZfbIlMq/vFa/EgfZAqt3ZBp+czaZqN4GWz+WF
	 nZMzWutuQplUg5puxIWHVG8+li1uY6dMgP8FuE6bAK3Pf3/0FxlWhy7rqAu0ZDBuoduNl
	 eoKmJJMg+OxWWqf9d++YPUOiMGPE/F8m+UIqgICcbsEOGKzcR5MT8+a3dHpHPMMdwnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JiS99EIO;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A997606A326
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 11:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A997606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JiS99EIO
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0cf2c0785so6159497b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 03:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794224778; x=1794829578; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UN7JSZ1+lhUpIQDrzhvOzINty1yZVzqD70nrLYHDV5E=;
        b=JiS99EIO4Go1HoIYZeJxU2J1B50BJtBIUE5TUO72UfzOpU9IMV//6coW5u4kdWxdRi
         7GV7HFRpxP5IpfUd/tLyavgZCiBakxVUe3MzQYFSU+xs0B8Rw+xIPtcK9Be8iGUjmA2T
         HRxmKmarHywCpGzsxlJXKYbI7ZQ+46KqgS8bGw41ItgxzzKu9ZA2bjXBj3kIT+mKDLjV
         TrjazpdsvJjZ3o9lppjrRagVrhxJ+NvUIkFd5j/L0AkLitKL7JO3nMXrIHeCeYb1ixnj
         D5330cDShIwS8wWxue0mdDJUr40/P2qLYV9MTjkTuDl6RJjMb++HQdBHZCGN1lVGmyt3
         RyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224778; x=1794829578;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UN7JSZ1+lhUpIQDrzhvOzINty1yZVzqD70nrLYHDV5E=;
        b=JTeBvrfxLCTFvUbPlXEu1t4XFczDFO9eU3dZOV+KWSsWaMOoqHppnVELN9hK268Hj8
         fUxH8Op+wcihiODCPjA88AYQb6rlvGCr3cMqn++CzuK+Var+Bekz9lPDHPgcoZFDyTgD
         jc+sdPTFhJoWOnFo/JOoHznLfb+2qhI3wMwlzi/x0/fBrLP74fAG2NOTD9sAD3oAM94r
         hTI2N4t8lKjdc0bhLfr9L3wvp+kN5Mi0pOse/QwK+8PzS6d17oNdsoSiW2d0mahvB39u
         DGE/r7S6xxX9PiJJPIYZ+NgRRhRKJdDH6dUdTy39fXNH2pFZZpYVN+wqLrG+nvymfiAp
         8SOw==
X-Gm-Message-State: APuU4Z83kpz1EFp/29p2qgqpUCy0UVmiSjQPN/5s8U9lnhxDE7QOzsDs
	woRTWjW8BaUDYWA8zqNB5vyVOPVuLkCd/3MqTRWw69s2NcZzUJy++MID
X-Gm-Gg: AYBFou2JvSc3YYR3xK4ylCla9hjxniyKe3UL/3o3kVQykyHWvtj8H9Vwo02PNX4y0d5
	BmlisR3yRhZ0jQt7F2V52Y8iejtmckN56kXk7juXot8ZV46vcIimtBG4swuTsy9Xo4QBmVF8GJz
	hWHAJ+CIDeiVqVbtXC9pf5/WxKSztQnOwM3j2Df9qswEixt2tFZp3TMvbjs/sDjiRosRG5Ew/8N
	MGTuBhXEyW7vE7IwM/xvJ8FlosBHiqqXuUI/EhJqv55O45J/upP1BocBuUyrfWINKYZ3Kbjn+wI
	qsJ6kovfB+t7fu09dckaDFkKXqgy3XobwcSasmJ+EQ2CCha8C8N7mGRkQTdtYTkXHiyqPoO+7Nq
	kctpEsO9lnl5/tdLg3hq2G2tkSLeVZaZE7/ctZ3DLchNaoKG7gaJSAoeiay6DYOkqSZsa1hRwcI
	LuAxzJU9/xaya9n4m20miJquh+ug9521XCJNuMwOxdg206g07oaVr81Yi+ZsLtMalCHnz1L80lI
	CLKzcF55Yifai0Pxd8YLTpjSnDscequHS0vHXY6ek9scdj7T2j7MV2fqRCVaJYsv1wKFHimKOts
	5uWN292cUh9drDa3L5QB9+3iUQ8MyS8WYmslRJqFr2TQOff/7GXQYbJQuKIbtUIOYrcabpX5uyW
	VyE7km5jAjsjT1vgmjp7dD0Xk5EUW3anp1jcmTK14jTIZrFZjmP9WyNovAg==
X-Received: by 2002:a05:690c:e3c9:b0:8b1:3606:65f6 with SMTP id 00721157ae682-8b36cb746a1mr21155677b3.64.1794224778309;
        Mon, 09 Nov 2026 03:46:18 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b63209asm32984397b3.6.2026.11.09.03.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:46:17 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-sunxi@lists.linux.dev
Subject: Allwinner T153 Linux CCU/reset support, is anyone working on it?
Date: Mon,  9 Nov 2026 08:46:02 -0300
Message-ID: <20261109114602.49907-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi Yixun,

I saw your T153 RFC for sunxi-tools (#252), and I've been looking into
possible upstream Linux contributions for this SoC. I've ordered a
Luckfox Lume (T153) and would like to contribute to its mainline Linux
enablement, starting with the clock/reset infrastructure.

Do you know if anyone is already working on the Linux CCU/reset support
for T153? I'm particularly interested in the R-CCU and RTC/low-speed
clocks, and I'd like to avoid duplicating work.

Thanks,
Vinicius
