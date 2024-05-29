Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7693156C4D
	for <linux-sunxi@lists.linux.dev>; Wed, 29 May 2024 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716992398; cv=none; b=Ot9jrAaYTIe5vtyx3jiYh8a6Mjs3zpdoGct2/pSjuYIhFckoekGdXB7ldXCTb4iYHVBwS7ucJYx9mr97e4PzVnnDYYyetB8lPqQURZGdDsZpz6hpk0WdYlRYIJEnp7J6vgcj5G0oLvihBhgwWuQJKqkTo5UPIfVTsvGLsFE5cYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716992398; c=relaxed/simple;
	bh=/idmh+yvnaSR4zr7lwwZqADvCmrc14Xu+3n/mNDAxNU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=sz6gylTIsMUVwW8BfVTa91LL+QfuZAjPyKDCgY9c8sxvRCD2Q/X+bjiv+JPM+mV8e9bjrEChf7/jIAhUYbM3rGmP7YaLjEpOTUqj/Pk7wu80x+7cPSGMUCuqGvice6CcZX5JytWmcctutokkiMzUifNn+aG+tVgYMQRn26TfNNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhNH3qE3; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhNH3qE3"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52a6ef5e731so1363289e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 29 May 2024 07:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716992395; x=1717597195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq+U7SgBQTVMSMlIy3UdyJxbPASA6waFh60Q4P8YQkA=;
        b=WhNH3qE336/qwm5ZDpTgHz3FWbqEGZyMXLF5bcjF1pb7VcfhkGAhNf9ICwZ1MzkdOO
         WZQ4p2gdYceL8hOtAdPeMlmwEG3EKqecjdDLZsQnssz8HxUHKufDOnTglveZwin5fLzb
         jWHa0R+JoxxQtx45z8ImWdC/BNE6169iV24jNYUPjkD458meRLrko7v4Ogq0oHuwSCXt
         hRQqJ2Tfpste55OywLfS0efL2qfJO0VdirSwoXT1xg162bCC56dwsXy/8mzjDo3Faxrl
         5jgUJ1TZblZxr3LH4EVYIIIkFD6WZPKQjw3c10L/g2Y05YfubwFmTFsDb8gmyZ/SYViE
         Npig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716992395; x=1717597195;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tq+U7SgBQTVMSMlIy3UdyJxbPASA6waFh60Q4P8YQkA=;
        b=EAG7K94D12md2Smnxq0TLPWoqMSyqyltY/0zCg83vt+U7JAavliVNGBXr5BM2E+7dd
         CG4cHIDJQ2jo+26413Sz1pSCJJ6WebB+1Zg6E+itqPui/LF4iWkWhtQX4c6Ij1RBXtfC
         Trv+5+WVL9JL10qJxnMmoYLY+PTFsV3EPpWaX9wYbYyDuRpFDldHkfuimr3CSec+mlXK
         1rvH2fveYxOsnRSAFoK9f2OssCJttWDBMPzbclvNLA/IujSXDIuj+DJO71+itTnby2LL
         y2Vs1K4UWoP7fIUhtt2CTmQMgVdzki7fxKA3wfbbFRw2NXQGjCFMBhU44bcmnHJOuXdG
         jCrg==
X-Forwarded-Encrypted: i=1; AJvYcCVhpJlYCrXwnagHiWAxmL1UQ8gl5S2NfDx+L/5zPuR+kn2CJ8yWUNIZIZNdxt8+1H5nHeha4HROP7aHHLvPzN4Jsja2/PVFp8zFZS4=
X-Gm-Message-State: AOJu0YwiJTmYNElKLKOxTQo350J19jvcoZyQ3CSqOSQ9gyH5jpYpPogY
	hA276jrG+b5Bumy5t+4f7/EKewR/7pBi7WhHJkClGORMZGp+XZSw
X-Google-Smtp-Source: AGHT+IEBaR/9ZV/mnHVsdgn/YHZs8SuvACBliDuxAG8jTdpQo11v0iyEkLahEvTKgb1TwDgy1y4KxA==
X-Received: by 2002:ac2:44a6:0:b0:51d:d78:4952 with SMTP id 2adb3069b0e04-529666db627mr8232383e87.65.1716992394518;
        Wed, 29 May 2024 07:19:54 -0700 (PDT)
Received: from localhost (host-95-246-50-43.retail.telecomitalia.it. [95.246.50.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6286457089sm629483866b.64.2024.05.29.07.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:19:54 -0700 (PDT)
Date: Wed, 29 May 2024 16:19:53 +0200
From: Matteo Martelli <matteomartelli3@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Matteo Martelli <matteomartelli3@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Marcus Cooper <codekipper@gmail.com>, 
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Message-ID: <665739895996a_26e4f3704a@njaxe.notmuch>
In-Reply-To: <a003dac1-de47-4a15-8959-25f7d5f1c129@sirena.org.uk>
References: <20240529140658.180966-2-matteomartelli3@gmail.com>
 <a003dac1-de47-4a15-8959-25f7d5f1c129@sirena.org.uk>
Subject: Re: [PATCH 0/1] ASoC: sunxi: sun4i-i2s: fix LRCLK polarity in i2s
 mode
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Mark Brown wrote:
> On Wed, May 29, 2024 at 04:00:14PM +0200, Matteo Martelli wrote:
> 
> > I found an issue on the sunxi i2s controller driver while doing some
> > tests with a Pine64 A64 host board and an external codec (ES8311).
> > The A64 i2s controller is compatible with the sun8i-h3-i2s driver.
> > The LRCLK was being inverted when the bus was operated in i2s mode:
> > normally should be left channel on low LRCLK and right channel on high
> > LRCLK, but it was the opposite instead.
> 
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that 
> any important information is recorded in the changelog rather than being
> lost. 

All right, sorry for that. Should I resend this patch without cover letter?
