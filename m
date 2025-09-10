Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1129F1EF091
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757521505; cv=none; b=mH1pdfnfVNY/lEqOiJBNZl4+5IF3k6abHxuepsO3vAwUzO6cqahudLmdRQUf8t1OXt17y3y6n29hZLPWbvYsC5q+w6BahH4L+qEqcBWCjXERB01I0Gbh88jPSIzR2eC874vfRDAByKsKP2LAwLWMhFHapf18Vt+Sd6faeCl2rSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757521505; c=relaxed/simple;
	bh=PVVvBseAPUlU4+sGMSyOwKlOi8Ht8hVrKPWpcILrkL8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Gvf1EpvICxuCotHMM+ZwKK9raIFb49U6olYkUsGMhGHrLUBTj4Giv8/5ruq9p74qx6tbSfdCNJssG+o+Ns0HKQ4Yk/QmNWfO92idIsRnFw+HNbHyn2+R7Hx5r4Ev6rNHE0xDtiaThloE3O/BuyGe8JOtIyKRkG9snQzHNiEYYTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RP6vDIcD; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RP6vDIcD"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-244580523a0so75568405ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757521503; x=1758126303; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bRPjaWUaJdPF4pn/4mDFNAtPsYAEZhzRiP398Jfiy2I=;
        b=RP6vDIcDqoWUd975oSqbwMHRDMb8dqf1SUfKr7SBqAf/fJZuLcfoTE10p2OTdqMGA+
         NsIMIapl84B6kB4mU72c2KiJAaNVqq5sMU8D7o9JgnbdV60Yu/Z0yp9i26mzAdSgg2Ru
         bKDaMvwxqirXSxeLQY111SIBDnZPKdvr8GQcbd4rZsPrY3ejGXlrcyArrdq/uNFYCWgI
         0kJTwhbSGPYJe8DdjejI2clawU6Qrv8q5BAxkgmTEssmWxzFsEH5kF0MWm25vCu7BcG2
         x7p02qVKlM3yBEzeWMqHsOD9tEIB2CpLf41gx9DxEGny5DkdvvhIyr0NEHws8JrW06Gu
         SxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757521503; x=1758126303;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bRPjaWUaJdPF4pn/4mDFNAtPsYAEZhzRiP398Jfiy2I=;
        b=toZo5YUCcRSsabAiOV1fYXEMdgPgG6gGgUHBxvnyVogTdfxtIwZCfp0prilUqb06KL
         RAKimNQVppTT2C6dlWWOXDmGOZhFTUIbG+vbkePK7X/dp00bvp/mHNudNXrAI72+NUcQ
         Xq52JyAih8sem1zGPwgw0iQGmlKElvLdUv2tVNZq+d7RpolaA27cSR8ZtiT8jHHP8k3f
         klHOzi/U0ncr7Dd61/166FFFCIS6868GEH3xJAyncSRtz6XqqhsdFndhhzo8NscGVl8p
         VvwGaK270lEWAGHX2M8GzE6HHNfsYyM0dA8y2Q95gwcMKYCvoY4v10O6tJh2AWATUBAe
         uyLg==
X-Gm-Message-State: AOJu0Yw1kI1tEdVhkMOYRWFy9ASR98s9OM8AY0v6NV4/eZ3n9+2PKQyh
	PMsbhMCluzlVGjdMf1d3tRfPkw9o/dxBBSeiyg9WMDiIXe/mjoN6GJpZJl52TV45RW1w+sZoKH7
	adISNBtle9YsGOoeDioVkqSnt0u9Npvav8rSV
X-Gm-Gg: ASbGnctsmp/ZoAfSSei8ivoquIuwf1uJBHL2oVPLl0RiyfLcS0sfe/6YFM7LTn/kkRQ
	fUV0yxedL9g8uEwwgkC/SOOHjTy7/BQShf671txnH1mfqqdU1nKlhUjuAAvh/5thM3HHmmZnuqU
	CRlO6QDOA2NgQ8sPE9L8pn2VeOXrE/L3Ic/OUSH2ida8zNvo/L/cRIXlHzH7/3RCLFFxjju9wZ0
	FQBkKpB3ZyqaHiLnWZGL6aQFf2MOyuL6IKf9uwumuEx9jvhRQ==
X-Google-Smtp-Source: AGHT+IFPiVd1k2neNDPLrFwe+LzjA9CI1cMRhfGKm2ApKooO/1rQjnbS5APMralMPTi0/nTLSG04X/23/8IXWBF79GE=
X-Received: by 2002:a17:902:d501:b0:24e:3cf2:2457 with SMTP id
 d9443c01a7336-2516e69aee6mr243991265ad.24.1757521503147; Wed, 10 Sep 2025
 09:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Horv=C3=A1th_Csaba?= <horvathcsabalaszlo@gmail.com>
Date: Wed, 10 Sep 2025 18:24:26 +0200
X-Gm-Features: AS18NWBszoCpiAyzK2ER1C0EKvdjtADboA5EU5ny8bOat2X1lzTOcivmwbZxPJ0
Message-ID: <CADGuG04vCTWJNDj-fPaEO-dQmk_P_Z-E+AYbZBeYt+GJ8Dtqtg@mail.gmail.com>
Subject: Colorly e708q1 and AXP20x support
To: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm building a wireless display on a Colorfly e708q1 tablet. This is
an A31s device, supported by Linux-Sunxi.
I have managed to install Arch and get Wifi with an 5.x (stock)
kernel, because with newer kernels compiled according to the guide at
https://linux-sunxi.org/Colorfly_e708q1 i had no display.  Debian also
works, but the device overheats, or freezes because of other cause.

With this kernel, the only problem is that the AXP20x power controller
is not working, therefore the device is very hot. I could not find any
information about how to get the AXP working. Basically i have no BAT
device, or any trace of working power management in the /dev or /sys.

Can someone please guide me how to get this working...?

Thanks in advance :)

Cs.
