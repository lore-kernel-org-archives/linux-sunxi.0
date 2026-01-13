Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F2C30ACF2
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Jan 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295235; cv=none; b=ILwKRXvuH9mV+0WFXDfHa5+Lco/fTfEd1hyrjcCivH511gMbYLVkvYwO1Pu2xoPg/xJIFtUyBt4DnDGyDoVuSPr0h3FgOJatu411Zg/RRNhLKP9fZI9DXhcUpq5nICDhIwD/2w+RfpbH7sKQ8IThSpF6XTQTZXLN47B5580ANdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295235; c=relaxed/simple;
	bh=Gm6UXpbotNSDfJECjJW6Uf4VMQ1XeRAz7sos5VG+8tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2CzWpgcPAK+4Ie54gIBrU4G6Cxc1ndi9uqyvsehV8culSAx9uAChrkkY2qx70qTxarMavTg9vEIDllTlzZ/K89AcLtoRiiTpDhKFPDO65L1Uciii7XEFqTBciw+6JPquQ67hU7axrMyxA1nLMcDdW2Nt5RrFNRlfYk9emsyEGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PuwKuXUp; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PuwKuXUp"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b78886454so5807911e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 13 Jan 2026 01:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768295232; x=1768900032; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/i3Juaj0N8yH4MFpXlG+cGqZ2qEdPdNcnpSqQBlYTGU=;
        b=PuwKuXUpEido1sGuOt1KKhKru1/NhuCoBIE587/I89NKKGWsyfHuVcfWtVASZmvyBw
         znJKBZcdrHDtYM0c0lPaqqcQOKzDi8gUJJOWr3c418HBjTAPsYO3E8G281W42BTrIWjk
         /OrCJD4nYXWgL8554DkjLlinuXMRoCD9O5SPCEn8py0FuAQ8FaKsdgcLNyvtVWl9UJVs
         8HJ4wvkuahV0vWUO/sfAAgnOqNQlfkJsk7lVQ1enCdKdNBqiusrpYQWCaK/7HGHXSzC8
         C4Iq91pZKAkZDBbOnSYUgR/XJ61C0muSXJnmz8sHIEZ9ZUwZMf/6Qpl+CDvERvhNwlXR
         Jfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295232; x=1768900032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/i3Juaj0N8yH4MFpXlG+cGqZ2qEdPdNcnpSqQBlYTGU=;
        b=AWwCshW20jC/enaKQ9h2cInSyagw+wHYapK6nR6Uda8ejQRogWU6Uyc/OW0/0OyHEu
         Yz1idIZtCxfgNXeb77gm1YE0QzuwJ3sgIfOsEtUCShc8giSTDNsEtQBuDnhr3dadmea/
         jXWVebEHewhVlhy3pOb8PZCD7L4fpRLmEokvmIrY6dG85ovINzhUlRX++WWxfDhl2oUp
         9Gx9Zfa0LiDSN45Ln7I/RZcjXGM3HPx8oDxpmEbp4RZXjRG20EQfSCHmM/8rqcxcjXjs
         YolvahNnT3rlX2c+jp2Hr3yIYm54Lt0GWP+bocbG292MgmdnCbQSBi8IC39VbfVrBfvz
         DK0g==
X-Forwarded-Encrypted: i=1; AJvYcCVTD5noGMoFGgBgFH5ZzjDGISOMKBJOaXixoSEv4aLEWi4QqLbhOZ8kCQbvRFngMwfMNQDG/PyoyN9Vig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6/n0tMiG2BqjpsbPVvDDzSOAVrCNUFJuEKKjyVrwy9Mc+yEaI
	PqZQfSicAL6d6f6Ab8ZXBY1ACZqSd1RhJXH6XPlcSLHzt8rlFWIJ/Y9/RQPRMjxd45xs6yj4Tka
	blCq6+wEwiUOCsMtcm4J/D7jX4ET5jmlWrH/pl+lEag==
X-Gm-Gg: AY/fxX5fmy52aEoHT9a062OKm1Ucyl4Z3EfoF5JehkKk3B9GUZ47svLQKPI++MlhKU7
	BFCTZkJAW9HqAhMdzN6UQ27BOkq2qjdEwWYzT5P/b/t+k2VdgUof9Wd+QDEpDfDVFLD1tBn0fb0
	W7pDOlEqCVyJjUNIRuWQVxenWHwd88s+B/cd9MYZ7FzfXOZZk7EQr3WE5O0c45+2qQv+z71gsZL
	Jm7SzQOUMfuxoU9NyfXYwL1uRM4thtUhTmIgRAY9w/nqrwO/Y7Bu22tOH6fOYmBK1XA6fsBMsaP
	mncUeEuF71eeF1iOTwJ/eoJ4WSMt
X-Google-Smtp-Source: AGHT+IGftEHtLClyb69mOyaEsN3lAH2/jF+5CBMjP/ZmjjcqXy+C8GOSWAl6T7IxwZIVnFTBz/aNdum5oAdTU7TVZB0=
X-Received: by 2002:a05:6512:3041:b0:595:9152:b932 with SMTP id
 2adb3069b0e04-59b6f03e5a9mr7195718e87.47.1768295232445; Tue, 13 Jan 2026
 01:07:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251105152023.259813-1-marco.crivellari@suse.com>
In-Reply-To: <20251105152023.259813-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 13 Jan 2026 10:07:01 +0100
X-Gm-Features: AZwV_QhM0_519Wp7eCusKGLkLbDhbtlDLW63gw69Hikozl3LItms4ZWAJbUiCUI
Message-ID: <CAAofZF423Fmsxb4c+J5q4Nf4t6YO+=-SBjna+7TvqJ=C1K0DYQ@mail.gmail.com>
Subject: Re: [PATCH] phy: sun4i-usb: replace use of system_wq with system_percpu_wq
To: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 4:20=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/phy/allwinner/phy-sun4i-usb.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)


Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
