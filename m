Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62650469D
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 02:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716431180; cv=none; b=Lgg90f2THf9RV9dGxZtwShTo1wsejbAMeQXi528FmgJUot/ZgiJagE6AErW8LJXFG9YVg2QCV81tT67C16dspi0PGbC4fBIDXxYtXwxhqr6oliCbc1R/t6WUA5DVuiNE+wdp8+Iacbo2Kwr/HTF2tCH1vOiFgEKlMhAWaV2XVt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716431180; c=relaxed/simple;
	bh=6pXbAmaEPZXIqK0WH+L/c24D/aC57W7K7SWkfWovUKE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UqY4DGTtqBkfsjYVDjYX5jcb3E9y+dq6DBes8fsCBx1w5t9Dsid8qmnlJzSrxHawyT1Ai+WRArv+XKj3oefeJZOFDzQc82hdUkrMS1wB9x08bNV93k3b+8shQLhDNHO+hk3nyPgyZe0dFpOreK4KmylmaGJFW3l3aOpUxrSFpNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Udp09RZb; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Udp09RZb"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61816fc256dso17500907b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 19:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716431178; x=1717035978; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=14MDcznVSAxWvh6NcnmWmS1Snv6rWvGAAp6hU32730s=;
        b=Udp09RZbuz4bZZb1EW+AeBPQ2egQgEAFY42w0zNf3CR+ZHDVtpFpHLWccZesqjR5fa
         oVBPGLpDS4RGQT7AddHYAVFxutsv80flr3r/pECsTdgSPAWUbYcH5THEzntzDrvlfNu1
         wS7B0hfvlQzktjiAPcnkJofFkTeQ4mNm6LeLKaUPtncCEOMNfpWC7trY+qPv25wx4n8I
         FHvpp2yvVAXMky6XbHCRTJr0JjeM+FXCVKrEEuqTqzDcsuRYk4p8OdHfMt3RR+bnSR6z
         Lt6CLc+sbthCllVJhjDXiu/4YTi4JahIMHznpCn+V+WYZKR0NAZNmWaLtLktYyQXG71O
         j+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716431178; x=1717035978;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=14MDcznVSAxWvh6NcnmWmS1Snv6rWvGAAp6hU32730s=;
        b=GO7/srvHTPaVtefQnsU5YVCDsioDXK7QnIdOnZScR9ivWNPdsocxtKiZqX5OgrDpGd
         BQY09O8HWsGkDFF/oiz++ubp5vWOJGv/5BByZaZAKOAMFHsrcfm11MWCmsnerJiqokhI
         bmXibvm/CLPqcMVxUFB31UjsbeZwIjl4GNxZ7fgryNwQ5BFD4rrGpN4ELGxZXMGQ47W5
         nVX/TVMAzh6t36Q+RHLUctxT+bec9D8mNTgXHHYpJdruijB3ptMdAvATOL+BsTVMVcu4
         HqNIB97pCfnm5dGOBBW8GMqHu0gZia531QAA4b6LqcEKmFQgdLJa+Urk+HdqK3kKTL0D
         VIuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5axXxAt70dFRA3tqfsbxD4/OG4xGkHrOlR1vb5f5/jodTB7B1rQlh8sreo+SJar7PCAxcoffYY6QTkRhgSe8USl6M0fw12cfTBHk=
X-Gm-Message-State: AOJu0Yzl9jYDAqddWBfL4O6i57hMu18kby9UJavkOJqp5DHwalJ0F5de
	Nu3E2utcXOuytlJvzVX+CyeVNqm/hWUc5z7EdWT/05TIrB+/LCd8HTiRY/YaAg/3zoMjdzaO6cv
	1ZeDvLjBEoFTsnGhmfvaC44tSS00=
X-Google-Smtp-Source: AGHT+IEzZ3d/y1htQ50ghcV3RsJuT9Nmb23jVS0kW1Opjrk11BX2iM4RFV1kES07q4M/y7BLnPYzixD6kqgZrYjmEI8=
X-Received: by 2002:a0d:e64c:0:b0:627:dd88:5f1a with SMTP id
 00721157ae682-627e46cf82amr36209267b3.21.1716431178362; Wed, 22 May 2024
 19:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?44GN44GP44Gh44KD44KT44GV44KT?= <kikuchan98@gmail.com>
Date: Thu, 23 May 2024 11:26:07 +0900
Message-ID: <CAG40kxGMu-TSchNezkcC_A97hzPnWU3KxeL-X-hJfPhjr_COyQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
To: privatesub2@gmail.com
Cc: aou@eecs.berkeley.edu, bigunclemax@gmail.com, conor+dt@kernel.org, 
	contact@jookia.org, devicetree@vger.kernel.org, fusibrandon13@gmail.com, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, mkl@pengutronix.de, p.zabel@pengutronix.de, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	samuel@sholland.org, ukleinek@kernel.org, wens@csie.org
Content-Type: text/plain; charset="UTF-8"

Hello Aleksandr,

I had coincidentally developed a PWM driver for the device.
Based on my experience, I find that dynamically changing the coupled
DIV_M value is quite complex.
The current approach has limitations, especially with resolution
changes, which can be unpredictable for users. For example:

  1. Enabling channel A automatically selects DIV_M.
  2. Enabling coupled channel B with a specific period may result in
poor resolution for channel B, as the DIV_M value depends on the
period of channel A.
  3. If channel B is enabled first, channel A may not be enabled if
its period doesn't fit the DIV_M range selected by channel B.

Additionally, using APB as a clock source for the channels would
further complicate the process.

To simplify this, I suggest (maybe for the future) specifying these
values directly in the Device Tree like this:
```
allwinner,pwm-coupled-channel-clock-sources="hosc", "apb", "hosc";
allwinner,pwm-coupled-channel-clock-prescales=<0>, <3>, <8>;
```
This would delegate the complexity to the DT, making the resolution
predictable for users.
As a bonus, it introduces a way to select clock sources for each
coupled channels.

For the meantime, I think it is enough to use fixed "hosc" and <0> for
regular use.

Looking forward to your thoughts.

Best regards,
kikuchan.
