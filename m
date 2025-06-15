Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A882676D3
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Jun 2025 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749992774; cv=none; b=KBJk9vNDg+eNQGoSP8BSXxOtvSUQLwGV/hXRcQsvrzZBEKUhnfqAr3LjzIjskSw+Zd2+/JVwC/PRAFD9SkN5e5JwBDle7noWLEXXZwQ2vZ0qzP/t+XC0bopgGuyCQNdO3ufzt5yvm6ZxRqM3xK/MHkSH3bEDbTO8HaS0S67W+h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749992774; c=relaxed/simple;
	bh=fSxCjIuvBo4A7fl+B7Db8lopzgrfjbWQHQDFBtBGwjw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Pi5LoqXDXTn6B99rDeyHmz8kZgRy03PQGc0wuIE9Z7kl9Vtx4YmOSRqjfuFwxkaf1ejUzj5nSoB4GK5qyI8PiOiwljk3NIsZHzoCaGWbeeCIoZv6E4pzLYAkjKjRbRDvRVXPR+MV0chSvQbL7PrIAWzVAu4uB2TukrHyh73jpaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zky2q3kJ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zky2q3kJ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad8a8da2376so588260966b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Jun 2025 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749992771; x=1750597571; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g51SjfzQX40A4wbP5H8wSwuT3GakEU9AeQC9zZKcUgI=;
        b=Zky2q3kJov1BobADpTKdqiONyQvpeuRz3+gUuNigdiSVqwxmI/FEG3Wi2FUmhib01m
         vSptBWh0Aa8xnos/7PvrWn0+kXLNhFM6vEP8Qjhr3gIHkEKx/5bAzLzZS828LIoDptn7
         TtqliV9VdPKYyFt4uyI2q8Yvkt3q9qdfxZ5mMg7Hz7LG5ibjTtjQugDXxYFwOFIQZcSD
         qHq4yBGlzOpk6DO0QNrB89qGwfHvYZM52ssBNsn3nb/DQReYzkPUZa3Zp1y/V6uYyQdD
         I/mSLVWWawkxtvgxnR88RTGWLzDSFasgf3rz0B7nHR/Vm44e+FoAoedANJEBYBNOVFuw
         o4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749992771; x=1750597571;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g51SjfzQX40A4wbP5H8wSwuT3GakEU9AeQC9zZKcUgI=;
        b=raCEc5pDoeH4P9LobB067VNGNM1cBIgYDC2PMlB2VLqoGno7FZPIbXRfUSNrBBU3RN
         41TmCLU6iwsxUvrT9FpW3KNJRRgdycRSJSw8qs31O1LQyx06dVfJvhneWnv5+dwcAR5E
         IiWp1e2nV9fzCdrd8Wl3NRV2xlfULNU2s5qBOs5OYkS+xqLlK6NUa743LZzlvrG5BccW
         jgQL8r/OirxdBQa2KcCH53U5Iy/D21+WIQ6Dl3953zF4IanL7G0fHCXb25AddXC7majw
         SPkzGIFn7XkbM4YGnnV16kblD9OlYSCs9RVrkVosxyTYe64ylCsQzBl1tc1rC+ibriXJ
         n3Ow==
X-Gm-Message-State: AOJu0YwUBqwz1VO+2fbK+h9R3N/CJJsiLw/MiJ0iKmz/XWZNPp3b1Woq
	hnCpQHUQuzYYiIo+LsGa46cM+XScFbEws30zp504YBs64EVzyk8jcgl1AVCixc7rPavuIWL2t6o
	dwnFdkrcFfM3gr3DnGZXNwRlsm9+3onyMFNl9
X-Gm-Gg: ASbGncs3s8IRRFzPFPpDZrYSXObV7GUT2s2BW35kEyY/7E2vx47lhc1UK/tTdxBW2/K
	7VYemqCxdAJoNU1U8gwJO/UwrJXITRNWgYDrMfNu7bcLsMJRfHzpnE7ukrHWdPMFJsKMoh4s9BY
	mU1U7K5HVvMLc21xvYU2FOAdOeKp4rtF0bIVtk/a4lxA==
X-Google-Smtp-Source: AGHT+IEJhLY1pMzvE/tpeT/GKYr/v7K9zfDi7VuJZVshZte08czKn6a6bkXvkBAkcQn+W5EUVUZfJb2VLKiGrCjFRlg=
X-Received: by 2002:a17:907:7e8c:b0:ade:4121:8d3d with SMTP id
 a640c23a62f3a-adfad2a1e75mr606982966b.12.1749992770659; Sun, 15 Jun 2025
 06:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ricardo <mcgrathricardol@gmail.com>
Date: Sun, 15 Jun 2025 10:05:58 -0300
X-Gm-Features: AX0GCFsuemesBQVfFaAm4ed9mzlgV6JcMaQ1TnfnsNKbtVyhpvgrwJ_DvDUQpJs
Message-ID: <CABWoLKm_-Ky5X7YyTkxOE3VCNGgxTHjYE9admGTHsGDPT93noQ@mail.gmail.com>
Subject: Failed to write USB descriptors No such process with kernel 4.9.170
To: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, good day.

I have an H313 device which have trouble with USB ports which couldn=E2=80=
=99t
upgrade firmware due to the following messages.

usb_ffs.cpp:232] opening control endpoint /dev/usb-ffs/adb/ep0

usb_ffs.cpp:249] failed to write USB descriptors: No such process

CPU:   Allwinner Family

Model: sun50iw9

Linux localhost 4.9.170 #23 SMP PREEMPT Thu Dec 5 09:40:08 CST 2024 armv8l



Any help will be appreciated in advance.

Mc Grath Ricardo
