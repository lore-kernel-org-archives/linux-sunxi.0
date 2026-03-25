Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE261D54FA
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 00:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398320; cv=none; b=X2y5/A8JAdiD80fGid9M/VrOvc90TPBhSLTvRsKQTKs4pSwPaXh3tAINPBlM0t5JyXcH4sX2Pxl0mi8vxSxSqM3imrI/+2/mJp/HKrqvVDXF5yawD5hr5tzwufvHlx/h4gKtCfL+Yv0NvzDtEGjn2+D+j9/icNUdlz0Al8VSjMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398320; c=relaxed/simple;
	bh=T62eLvCEArRzYZStwBuW/DskGoPmPid6WBtJuVPOf4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9KrjF9uph1swAslhy4TTXfUXXEE2xW3L4ZKWuITgpheiffxLia11ts6TAvwAIipsHQffinVNh1Xy/3ngXT+FD+V28eW27kZJwzdf1PxqIJOTQA52naWK9SGom5VrjQpW1dhYrbG303L1ojs+VPn0XOMIOru9k5Rfj3bs2GFCQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTEDQba3; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTEDQba3"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd7ecedf2cso449162285a.3
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398318; x=1775003118; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T62eLvCEArRzYZStwBuW/DskGoPmPid6WBtJuVPOf4Y=;
        b=VTEDQba3dxkF5RFfHRhrflCWFFW+ezB8ho8zZ2tgvfIi3pYewStFGtK74y371RUQfR
         p/lD6bP4SJJYhptOZXm10GTxxpCDjZtXvRJr4eB8jJfHyfDji4BG5LnQCvxQN9Qmuy7M
         I3sC5hKrShgjX9tAn/m1YcqfQI4w5uNoiltxy/BZ0h+pNDFnyb7NDgmOU03VhcAG1B8N
         whTzMBbcRuaRlDmjhp4hMyKpaTXrixiZJc9R9QoGWz7oY1cudExZARoFIKsVXNSDrJcg
         0Q9ofsZbaHjGbVEnvMLOqAjWhvK4V6zT0+xO2n+sQyi+E0U/f/wtuP7CFCQqqoO8VtY3
         wCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398318; x=1775003118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T62eLvCEArRzYZStwBuW/DskGoPmPid6WBtJuVPOf4Y=;
        b=nLozo6AHagWqob2kvlnUhoJk7JNtf2PUppOZnVXXn2dvD8p1YhNBqhbo0HBgCrWpFX
         vXlRsgrcQAemwdqF1KBsUrGGdz7CQd4velpPY52F4W/uSW0Y14eeubActVDNeauFDC5M
         rIeqidr3koyrZi255V+j4NWbLw9jwqeKaKezDE5vsRMpTSS8OBhDKROSQjVZvWcA0jid
         2wyK+Qkm4EN/qXLyKpzmhpEdI5kv8phD8X/6sqwIaQk0rucZ6tkinix2z79cBCcoGlzf
         1crvL218vXADLj12PATabAESjkoplQdagoq3FRWQixRkOAsHCTnFByorS8mZWH2e3puA
         KqUw==
X-Forwarded-Encrypted: i=1; AJvYcCXd217tYTxd53r+kY9iUxwcMIapVODiElphzbY4fEv9uF2A6IcrI3CJEyjPyqgUADneF8QT/drsWiixLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVtEyNXJHLOHh4OsVRek7LSIAoFLf7G4OQqSjr+JYPm6Yo/A7d
	wNFtUqOsrvLWOqgZxr5CbXOL00aLLgQs6y7iBjzry98x3TH0Rwo9Qrwq
X-Gm-Gg: ATEYQzx5txBk9WVjFSn3Xx/LKCunOt3qMrlZHdCE3zRZYg5rv1hxleNFUw2YbR2XzD2
	vNWTs7rUNthppbEW/Hp+w9NuLebtMd5ALAvlCa7l0QOHf7TYrJgJ1bQ2bZFoqxiL8tyUwvZmFrV
	N+RsofygLMzIrq8FjyICub1D3WWo1bxmQoYryQqECb48t2Fe8m7sZuZyywESYF7vLXlJOb1Ov1i
	tk5x05miLZ0nHTpnLpzErg01xGn3E+POOJ4CQFjv9thMlsSlrPapjB1uJlY+a6FotEc79lZrone
	q3D5OFDd+d1jnEji+j+tBH4VPo5jja2i4By+BA/r81maXkOV4u0t+V6ZZ/qFrkxFEZRKRwoCC/D
	rFjrXuHmORZZl6igXFRYoOJW2LsQmAuFAPuOC7+JbkKCrKcHq1Xjvj5Y5ByrEoDXQ7fXyZxX6if
	3EXMNVP78TE3fjc4tAaH6p26Zc4zQxN1bD81aAr1JohirXcmMgWY0l3h0olTrF82w3lHB+Xyyf1
	plSmMXb1QqdCw==
X-Received: by 2002:a05:620a:400e:b0:8cd:7f7d:b089 with SMTP id af79cd13be357-8d0010523b7mr229964885a.70.1774398318140;
        Tue, 24 Mar 2026 17:25:18 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfd55e79e6sm1017406885a.29.2026.03.24.17.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:25:17 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] soc: sunxi: sram: Allow SRAM to be claimed multiple times
Date: Wed, 25 Mar 2026 01:25:15 +0100
Message-ID: <2342486.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20260324164357.1607247-5-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:52 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> On the H616, the SRAM C region is an alias mapping to part of the VE
> SRAM (accessible in whole at a different address) and part of the DE
> SRAM (otherwise unaccessible). As such both the VE and DE need to claim
> this SRAM region to prevent access from the CPU.
>=20
> The SRAM claim API is designed so that a "claim" routes the SRAM to the
> peripheral device, disabling access from the CPU. So long as the written
> register value is the same for all the claimants involved, allowing
> multiple or repeated claims is trivial. This is indeed the case for all
> supported SRAM regions. The only known SRAM region to have multiple
> different settings is the SRAM C2 region; this can be claimed by the AE,
> CE, or ACE (assumed to be AE + CE). This region is not supported, and
> likely will never be needed nor supported, as there is no documentation
> for the peripherals involved.
>=20
> Change the SRAM region "claimed" field from a boolean to a reference
> count. A claim will increment the count, while a release decreases it.
> The first claim will trigger the register value write. The driver
> otherwise behaves as before.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


