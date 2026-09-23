Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5CB4334DD
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163751; cv=pass; b=JNX5r/tY00Cy69TXHf5tXds3OxvMhNUfDkbDvZCcw2r5pD+vhfXR/RInSYFJBUCoILOVU1wxOpdmf8zsq/SavYF4BwITKDK2u6ljcKk9EiIlpPzzv/5oiVTzKzM6+6N1/3HcFaHVJjfxcFTxSFLIPXVbd1cUmQNuGEdCewTM7t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163751; c=relaxed/simple;
	bh=nM7tbZ862fD4OC0Mg3Y7YqIbQSRAS6s7yXDWKfA5Yyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tO88ltP0iVDBELdBQaubUGbBKbPi53Wa+wSOK8M1yI83mg1uHaAdod5AbhI++cdX+x6w/GxYd0tCSHN3md7xTvFamDWogAWogUUHjVVnl7wp4cHZriDUXnkuDRhsmKs1uff4Fjk3tDuDFQzeHYzudRb4zV4DCdREqmXHuIUwOlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLAsQdFD; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLAsQdFD"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cc46c8so112185485a.0
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790163738; cv=none;
        d=google.com; s=arc-20260327;
        b=nZSwHWmcFPeZK0ooNpR+JrqC7d5SsRVwquAn0sxmqdbiB+2rr3eadNZIY1sB2A5g1f
         x2i5EFY8yb4sYdbyyzUAMmibLfo9vPG1UtBjpwaDdSPfMN65Li5ZPVfNM6CkNPxL1bZX
         ry2ffD3K4jjkAXorOaTSgyjQdh5lSIeh/wsWsqfwsfi6PUEsqxkV/EEtnVD+MfPOuq53
         madCx/yiUdAyw8oRoqnzkm4OzGb2VVMwLamfwOmy4/UOP5V5iiv9Fh2CmOFKIMCukEus
         gD3l44NKGDyZfHWTl+uuC8RVwzENRcMOp8cp2jmrqftKMNGU3/2vY96so0Nloy+0CA4O
         g1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pWFPGMzX1L+HVqe105PucXhk0+tLBSplzJw7zI8y/mo=;
        fh=lwyGNDOQCM6bD71NzkyFq8U0eHERvRMpiYYaLhF5azc=;
        b=AGgDOJa2UXLdVw7z/I8SVtz29c3fZKbJLkRqEwV3RTD+7Uo//jmzirEW3TjFCZLpF2
         WSYt9dQjztmz2YlZ0aO6SEYjrNHzHpERB8IYq3E4mv6w5bvrJlqtLT+la8PgJ9dT7prR
         gIx8OQVaNKEdk+UTVIHwYF8yB+NEqoEOW8H4/y/+yGWJVEUHOv5HJJI7swmt4RSqyU3p
         WwNHkX+DnBkQKCAZDIzEu/WVxq3mmcKJqOraJNF6sXw6Z7ftFoaa6kloPgBVMAUPmPkt
         n9jzwLv+ThI0kCgacUsTpMNaKLE1T89s0aU+aFvU1znl2g50U+SkQPFp3GCiAs9aZQBL
         JShw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790163738; x=1790768538; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWFPGMzX1L+HVqe105PucXhk0+tLBSplzJw7zI8y/mo=;
        b=QLAsQdFDSHJvOdiuWIUw5GDVD9EIDLtl6jOsbly8R8eJG4PI1TVFssVVn9enG+Foye
         uGNSzjknTYavaC9V4qXMmekiccv6iAJc0ieW1YmbaRW1hFK81iQ5WsPt2O22y1XMABg1
         L0YMTLwU6SnuUMAbUVUzP5+MVS5ZjXPB7Nfj3E+ZaGvz0+LAl9tjBhMyFu+frbkQzkID
         DyfGunRVo1uHIi8Hd/6VilcFhlSYKLxmTlnjLco3ZUJroEAMU1vBsqoaeDnV6zifhOem
         8O2SBFDuZYQPsk0v2iP2sbqTe9JIpkXj72G+p3tNCWPEL3zBvJF7UTOrMys+Ed0EZjwL
         AxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163738; x=1790768538;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pWFPGMzX1L+HVqe105PucXhk0+tLBSplzJw7zI8y/mo=;
        b=G6NVehM+pNO5HkzR/Y+kqJrF/CGhQ0WnhxVQBOGXVS4OHXfBVwljtFuHlLCe4qZAHs
         DU/KVBLm1sGeftgLJDiKMK/vNHCFnrTtFEc1b2TOx/Hn6zpGbip0HJQOZ13fF0biUgdX
         OlCVJ0EXvH5Getpa01j9w3ckh4ve7DqAzp3GZ1vF4nVDSVVacXosL+/sf3kzYCSS0YxX
         gCABY66uxsyMVl+p0S38SA30aMxNKzd0BcdDRXMvGoIHz1vBUinpqIEJto0R8k+6aG5L
         V8EZtRKsqex+0WoImuzXaOJ3jdX81FvpjsoABNQP/9uy4nIEx41JwfO70wWs7Mq7AfSs
         lS+g==
X-Forwarded-Encrypted: i=1; AKwUvBwsDUAMVWd9POXyfCPHNh6lhEzv89VWeW31PXiV3pzCF/mgRh+0cw2+XUx3g3u1PUpSDOUDQ3iYYimbpQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mz4Fkj00HfXuasSby4PnnpLZcOyyef0TkSL+bK6Fm79cnNd5fc
	kezoZpzhsf8c4Dago3RB7I2IT4pnNn7lqSchO0CfsVDBU4MU8aDLFrqM94F2iwLCmlgdbsLiBp+
	lyW7sWybQ97Um15qbWfGpmgBY/Id7wYxvuCQ6AE3MBzpB
X-Gm-Gg: AYBFou1AytKtJZOEX9L1GJUGmPjQin6zNJtJTzHt3iXDd5u3wcLzTjalRgGfQtFutr/
	6yC2xINH4cBFdpPruDWQYoa9btpQX+qPzvCizlDb+yI6QrGQoeZFm3/rHawq27hIDfBseyEYK7x
	dCDYmDcl8b+5jbt7doWnr2Q2VSc62RoGlwBrHWlfBKuZwYHNSCr2EktHgk1ptQRjoRAjGNNc8hj
	VIKBaN8q4bitfdyENUnuY31zwX6J6kS5UU6W/JRSgVmqUu1rTWnxTTA2lHSmqrC7c8R1fkdv77G
	UhMzT72t1w4cqK8sUpEmWvmTZCU2bq1rBVGzRARIMmis3JHi6qClXlfR/qntKrltLnvx
X-Received: by 2002:a05:620a:2a04:b0:939:b94c:3e85 with SMTP id
 af79cd13be357-93c250f8407mr332746685a.24.1790163738125; Wed, 23 Sep 2026
 04:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105208.198-1-anykey196@gmail.com> <20260923105920.CAC761F000FF@smtp.kernel.org>
In-Reply-To: <20260923105920.CAC761F000FF@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:42:06 +0500
X-Gm-Features: AcwNN1WQplWtIF5el8zF5Tmhe4QX7yFqwnVJq9zazF13PvpPkafeV1wGHPP3_pA
Message-ID: <CANHPwAR6+f0dtOrBdwD8C4_cO5HvnpNKNnhxLZY+Bm6h-dicrg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin
 expansion buttons and IR
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thanks for the review - you are right.  The two buttons and the IR receiver
are on the optional 24-pin expansion board.  With the board detached the
LRADC input and the IR receiver pin are undriven and float, which can lead to
phantom key presses and interrupt storms.

v2 drops them from the base board .dts and provides them as a devicetree
overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a Makefile entry,
following the existing sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.
