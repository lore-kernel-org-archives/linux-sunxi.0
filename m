Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7518A26562D
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Sep 2025 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757852540; cv=none; b=mJu4WCl7MRS6Vj+l01/HIpRpLsh7E3TNLcTTvl5005W3fWjRFfKoLlj4Rlvf8hM+cyX7oczPfNlup9jGguMg6927szgZp6A34ruCZJu3GdimA9m88QzjzDWgkccoL3Vyo/oQ13L6TBko3bDqo5hZsCIX5gY5m9oDsXrRhokICXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757852540; c=relaxed/simple;
	bh=EaiqKlnq9eFO6In87JrKFVDnVqzBVAZnAQlyc/I9aYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=tIwVve1fDH8ObG0CQ0HeYIGAlIaCCTY6UDY3j7IMT+8QkCgFOK1JAUMHHes8I+VOdJozYWr78xM3D0pmMlyFjubogO71nM983DBwWv6SWn7H6lC3fVMYP49xiG01HAR/vqLsgViaDo4SrdZr41XpoghoE7gj4TaRWEP301JD0S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClLKFI3d; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClLKFI3d"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24c89867a17so33340975ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Sep 2025 05:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757852539; x=1758457339; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9QaqFDm968hxgUBIhZprbXUlWRJcjVcI14Y1ubOyU+E=;
        b=ClLKFI3dA1jTH1sXPd8XL/csuIfjyBAJYjUNxkGXhAwpwhnUAGZ4fLbf2mmXvQRWrU
         hyDDhqY9JDo/ayn2VH8kLM3itXxLrigU1Wm1SYP+nImM5oVCeDdRaqCdH3cX8OwDlM+P
         +W+y1Suk1eO/uAqKDBhbeSZhMm0jDr5hYRY66z78zR1L5gO/GuJPSwyIY0xjldlkpI6m
         /0NUuRfGefBcZ3e0hYeWYMDE/mY/Dy9zGU7K2w0vuWzNjhaaHRRpYG+35+kDyQ+lQuRN
         HMHRp0EHhBGKsucRD0hEMJpoCV4KC3hDVX/zGVSTDVre/Cw90zXWuQqd73S7OIYOQQM/
         ObHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757852539; x=1758457339;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QaqFDm968hxgUBIhZprbXUlWRJcjVcI14Y1ubOyU+E=;
        b=sKKVd7/KAJ4G2tPVe1Z9FxDndRn+3OfkOkVxm6WKGmbTyUy23Fn50bJJ5aE3/qB46j
         znLcSRyORka4LeBfQFpLSxvSRWJuC7+/N3NjTma72rQH2P3IZN7UQ3UnjcccI3PYm1dD
         bshKfVg+mtx3MwIf3/ELyT2pFajPluobCPBtcHB1hYuQJLp0YQtkItCp27Qso5oRhQBy
         v+NGC/kflgv+X0SNV4AutlrkLsgZHfZWnBwizsJTCo4QVzfSwp3ugggDn2blMw4CrNvu
         tNLiyjOmz4hdbuupSV7wsnNOOysCX8GfCoOuqbwtueMSMEgLFZ3qVLue1yYhnwscgaLY
         HWYg==
X-Gm-Message-State: AOJu0YzaDou7byCx0RkTcHr+lHg30Xuc/8DXFrvfr3Kq/EJfWUSskSIN
	V8U8iK1vkLSu8D2lWdHLP2LsOg0LKJ73uf9CFs6ZgGX6v4Cb8iRPZQ6Me7g5rRLjFnGfxZpTeI9
	afkqpYBPU7vov4Y9ovJyYllSE8fNt35/ykyub
X-Gm-Gg: ASbGnctmk8iCLp1r3oP0NVnkvvPNMp7KpfLxN4pBkg95duRxkx0Ra/rm5ykAWRmptE+
	XIHi6IbuWvuQBeRWXNKkJ3wHMa3LyI0Xt1IAwYm7jHKPFJQ2XpbPfN4WRMPPukWv261EQ1ln+2s
	4K9JnQFvf5fIH1nrpyyRZ0me8KXSokOt8fFKAp9v1R6RknRUqMCOKzuRatJL2Yj9xPUKdbEaKQN
	WBRJcny4lJwJoq0+3JeoE/mi3lB97pZjH3z/XA=
X-Google-Smtp-Source: AGHT+IGnnpcDYjfzqCmAvkJlUscOmtnOwoqYEMRfNulP5Z+tb8ffiu+a84Bvwq5DBYtP9x+/uaQH6vm7gB1sxAvooNM=
X-Received: by 2002:a17:903:1b4d:b0:250:643e:c947 with SMTP id
 d9443c01a7336-25d26864f83mr112051975ad.28.1757852538680; Sun, 14 Sep 2025
 05:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADGuG04vCTWJNDj-fPaEO-dQmk_P_Z-E+AYbZBeYt+GJ8Dtqtg@mail.gmail.com>
 <DU0P190MB244572B5A5516B6BB3E053EEBC0EA@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
 <CADGuG04Bc8Dcv=GCZGsjkW7taS4VR0yTkp=BC9tC90HtkssVRw@mail.gmail.com>
In-Reply-To: <CADGuG04Bc8Dcv=GCZGsjkW7taS4VR0yTkp=BC9tC90HtkssVRw@mail.gmail.com>
From: =?UTF-8?Q?Horv=C3=A1th_Csaba?= <horvathcsabalaszlo@gmail.com>
Date: Sun, 14 Sep 2025 14:21:41 +0200
X-Gm-Features: AS18NWCV6CCFecVv1L-mdnWhUFpI15mZkN7fXPVpb-5ZLrKSN_JiSeOWBBN3a4c
Message-ID: <CADGuG06z=_JCGeC7oG565_GeXYtQrY63m8sVAycq_WZQLz+QXA@mail.gmail.com>
Subject: Re: Colorly e708q1 and AXP20x support
To: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry, if anyone answered to my questions, but i got a message from
the mailing list that some mails were not accepted by my address. I
guess those were sent to trash or spam. (Although i haven't seen any
related to this in spam).
So about mainline support, i discovered in the past that someone
changed in the 6.x kernels and the Colorfly is having issues with the
latest. But it's not a problem, i'm fine with an older kernel, or
would be, if it works.

I set up another SD card for the tablet with 4.17 kernel based Arch.
The symptoms are the same. Tablet runs hot, and battery related
devnodes are not existing.

Did some research, but got nothing. So now
- The tablet runs at fixed 1GHz, so i need to lower the frequency
(tablet is too hot now). Cpupower does not work, as soon i set the
frequency or governor, the device freezes. It would be enough for me
if i can set a powersave/ondemand governor or a lower frequency.
(Tried in /etc/default, kernel parameter, echoing to /sys/class...)
On the 5.5 kernel, setting the scaling works, it lowers the frequency
(at least in the /sys/clas... files), but the tablet is still very
hot. (53-59 Celsius)
- I cannot download a kernel source for the old kernels i use, because
Arch Gitlab is not accepting registrations now...  would try to
compile a kernel, if i had the source.
- I have seen that in dts, the battery is disabled. I tried to enable,
but has no effect (simply compiled to dtb and copied to boot - is this
enough...?).
  The dts is containing a lot of settings for the AXP208  (if i'm
right) chip, but device nodes are not created for battery and so on.
Modules can be loaded, but no effect. This is strange.

Can someone please guide me what can i do in order to get a lower
frequency/temperature and maybe get battery properties?

Thanks in advance,

Cs.
