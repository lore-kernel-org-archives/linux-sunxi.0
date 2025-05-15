Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B122224D7
	for <linux-sunxi@lists.linux.dev>; Thu, 15 May 2025 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314980; cv=none; b=a6Zw9Ad9YEXdvLwBvAoLK2YahSWjFCXwi4xO90u2NpFgX8Cdln/tUIgImEGC1z9u3wyA7Qp223iCh9MqweCQYkxG4ETZuisBGOyFxHuXeoReyvHzOu6rYSYhMz/a58TcAgbwYtu248QplAri6uTlbPITpBE6EMFjY5yzawAYCHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314980; c=relaxed/simple;
	bh=elJmViE0+zkHKbAVdLZxp5PwUVCT8EBqTV7h0vGIzYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdaYyuycRo/bbX+rUmd8Qtkc3feBm12DJwpmzfYI4YBxMfz567jgE1UZyqjHKy3kcnsi9ss1xn0hewH3/IMoJMibb3sLK/l8oT8p9pgOC9MEyCdRoZOsk1kfh7DPFUpOiHHJFIlzUHcm4/mUKWVs9YdDWVYYXwAxVaeND1JTL1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBIqV/Ep; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBIqV/Ep"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad4d5bb4d0eso167878366b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 15 May 2025 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747314977; x=1747919777; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elJmViE0+zkHKbAVdLZxp5PwUVCT8EBqTV7h0vGIzYo=;
        b=VBIqV/EpDSMUWhtJNdAEMvevrdAAKdhomr92LVg9f8oisRtcPJLO4mDkU0rT7vEdWa
         ACyumqr6+lgeHWSOPFu5XzXcCTwHu3/eis2uxxicfo4VFAo+dfg0hOW3Q9H4+LwAyV0E
         NhWvEqy6NPnXp7HRhJdld/r8DuXFjGgdk9JaAqFaJI9+9L7qD5iKJOUT6hd45rMhHEcN
         mtefMCv7fzywLf3bXsTxFpEm+8erNqXAoawwCsG8gDZGb1vWj4M97b5uKdDyydXtS8VY
         M4UPZ2fzn6cj4244AOyJSu4piVhfg2gDKu6fQMMc4X47p8Y4/LdbBSyFUBpifNVYjDoE
         mtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314977; x=1747919777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elJmViE0+zkHKbAVdLZxp5PwUVCT8EBqTV7h0vGIzYo=;
        b=a7yrDWuTw5gihdAZB+tK1gMwYe44QuIM6S6OXjsrbg+0HEyrey6GiQzCBQGL8UEOlF
         kRm3akXcS/Bn086DFvi8vRL7g8TvonagiYHw0kM2D1hBYvLtdGx4WE6UO1Iqp0AruV/i
         N7hcaj0/lCECnTAI2MgQ/U0iGTFc+gAi1dlH2odBofrJo/NbvmUFvRYjsT22WK/C7gVf
         L8kS4wGPZVECAT9ztEXfdOviP3yTkUqG6pHdk7R7D/b0UJfIxha1z0L+9zrPa4rgi97g
         wrUmP7w9vffGZXho5BSrZhyxDEPX9os+kPtD85pxl60u5uDgwp32FoxuZ4fFyl6/Fc0m
         lK5g==
X-Gm-Message-State: AOJu0Yw/7K8GS41+oUmHwiOFv1CvyDwLbzc0i3USA15eArbjsLzaK5i0
	MhGT22wptl98ifz9/IksQ0ZvXxRBRVrVNUk0n2h057ncL7o+Ah5mt2Bk75Jl0fsy/cVoypLYzai
	exBkDHwFNoBF0i2YFw9lLXffOPyuofznc
X-Gm-Gg: ASbGncsUSiD1ZQa0S/h/i14RmY1RtqMwA9grir7yLAve9zaqKNQTH9ZGuNf9kCaOn7N
	LHcAbBF9W1b/Xy203KQkUlX5BisrXcJOSmHlIil4LK0oW/QVBm4VamaxdW5YHNQVmUlIoLX0gwl
	xiiKyEq6xQw1o4/yEAiznzXo2u38qDYQkp6bOvNhrDXjdgtFNPLvp1JeyW3Wyk4ctxcQ==
X-Google-Smtp-Source: AGHT+IEqTwt8a6N7+UGY67sygjCbszKJLj9p0DwRj9EZrCE3M3QeD+0HTEkJX1pjVd9Rh1mJRIuTJ02eT/ROyCHTqyo=
X-Received: by 2002:a17:907:d1b:b0:ad2:5198:d715 with SMTP id
 a640c23a62f3a-ad4f71a915emr855658066b.19.1747314976317; Thu, 15 May 2025
 06:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250508143411.4534-1-gupta.shivam1996@gmail.com>
 <20250508162526.720c3649@donnerap.manchester.arm.com> <SJ1PR12MB6313678B38CB96D3C24FECE5A08BA@SJ1PR12MB6313.namprd12.prod.outlook.com>
 <20250508170507.3d426494@donnerap.manchester.arm.com> <SJ1PR12MB6313123CC3D9C79C9E51BF93A090A@SJ1PR12MB6313.namprd12.prod.outlook.com>
 <c3e6a5cd-3985-4e71-b2a4-742303836660@arm.com>
In-Reply-To: <c3e6a5cd-3985-4e71-b2a4-742303836660@arm.com>
From: Shivam Gupta <gupta.shivam1996@gmail.com>
Date: Thu, 15 May 2025 18:45:58 +0530
X-Gm-Features: AX0GCFuRI-ldVNcPWdpo_2wdvVxylQPNzo6zdebcip0SE8fx5b5cNeZY8SpeVE0
Message-ID: <CAEgCTJsPuFsq0uWrVQU1bUYg2hyY5bJz=YgjdPfre_NVKPRe0Q@mail.gmail.com>
Subject: Re: [PATCH] add Eachlink H6 Mini
To: Andre Przywara <andre.przywara@arm.com>
Cc: "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Here is the defconfig file I used:
https://drive.google.com/file/d/1-XhF-EVcpj7hQAI9HC4XnS8pW4_qtrE6/view?usp=
=3Dsharing

And here is the dts file I used, based on the Hyundai A7 file
(https://linux-sunxi.org/Hyundai_A7):
https://drive.google.com/file/d/1wBzdUPdZcYzkj61bfAc4hyjE68G2x6v8/view?usp=
=3Dsharing

I did realise yesterday that the A721 is quite similar but could not
try compiling for that, but I will do that right away.

As for booting, I did follow instructions here:
https://linux-sunxi.org/Bootable_SD_card
And created 2 partitions and wrote the images, but when I tried to
boot, it went to android instead. I then tried using sunxi tools to
boot over USB using the same boot image, in which case the screen
flashed white for one second and then went dark. From lsusb on the
terminal I saw that the device is still in FEL mode so assumed that it
has not booted into u-boot.

As for serial access, I have not done that yet as it would require
soldering on the back of the board, so I am looking to avoid that.

Hope this information helps.

Thanks,

Shivam Gupta
+91-9591952784

Shivam Gupta
+91-9591952784


On Thu, 15 May 2025 at 14:53, Andre Przywara <andre.przywara@arm.com> wrote=
:
>
> Hi Shivam,
>
> On 15/05/2025 07:44, Shivam Gupta wrote:
> > Hi,
> > After I extracted the fex file, kernel modules and DRAM details for an
> > old (previously undocumented) A10 tablet (https://linux-sunxi.org/
> > Softwinners_crane), I am unable to proceed further with u-boot or kerne=
l
> > compilation as it seems to need a dts. Can someone help me with this? I
> > spent many days trying to write a dts based on similar devices, but I
> > don=E2=80=99t have enough understanding of this.
>
> So what did you try yet? I think the most complete A10 tablet in
> mainline is probably sun4i-a10-topwise-a721.dts, as this describes both
> the panel and touch.
> You should copy that file, then go through it and check if you can find
> the respective settings in the FEX file.
> For instance it looks like the touchscreen is the same, also using the
> same parameters like I2C address and interrupt, so you can keep that. SD
> card (MMC0) and UART0 also looks the same.
> If in doubt comment or remove other nodes in the DT, then give it a try,
> to see how far you come. I'd recommend using serial, as this has a much
> higher chance of success or at least some output.
>
> > The fex file can be found here:
> > https://github.com/linux-sunxi/sunxi-boards/pull/72/files
> >
> > Another problem I am facing is that the device boots from NAND by
> > default so it does not boot from my SD card. How do I get around that?
>
> Are you sure? I think most devices boot from SD card if they find the
> right magic sector on it, bypassing internal boot media like NAND or
> eMMC. So what have you tried, exactly? You would need to build a U-Boot
> image, then "dd" that to sector 16 of an SD card. If you have serial
> connected, that should already give you some output, even without the DT
> being fully correct.
>
> Please provide more details like the .dts that you created so far if you
> need more help.
>
> Cheers,
> Andre
>
> > Please help with this so I can get something up and running.
> >
> > Thanks,
> >
> > Shivam
> >
>
