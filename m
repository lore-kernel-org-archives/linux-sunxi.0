Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006646B7
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Mar 2024 17:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709313758; cv=none; b=qlLRIhxBzyIwx/ZalV4Ovnfo2UxzCKRa3R1+2Tk7a+I54+VSE+pbCigOmpUCJrJAwzi1KCBbM22XOvAmntgm7iOe7ExVD+L/9t496hlytqSfnLDdxZnNgoyvbL9BcAMqdHgdRqHktfVm1JoPfbi/Oknong6NA8DfWXLenaRiNxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709313758; c=relaxed/simple;
	bh=rqWNOboH2nAQqo7skbUOdUM2q5r76m/KRW8dhcN6Nzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQGcU9N2baOOmkwHUcWMEjIa0cDW5RsqoCOmMtoF/M3TFP0lGGxu3MWc+j2KiBXXPj/uEMlFv+t3uyEoanepVUJjzs/9RD5wjNtuPvGMBZcs4wimQeoppxV0iyAjD8D2Xl6L0x3B3PUL0bqkpHoMZTbJP0RWpaZkTq8QBmFjXI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQNjNnoE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQNjNnoE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d9c3f36c2so1167003f8f.2
        for <linux-sunxi@lists.linux.dev>; Fri, 01 Mar 2024 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709313755; x=1709918555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37WDRV9x4Xm24khamq/oQN+S82VH6v/HallOiNR2z8I=;
        b=QQNjNnoEjG2iRsUYPxK2zhIFrIN62CITI0Yq54b3zKhbAnpIwkJxFUyeM8FHef8WpG
         uk2sj09tuK8ZBn7QyHn8XkNEnAx13Zu6w3ugyltF7gLwDl8RJi4NPNoVP4DBD5vgAv5A
         ZIXLcazXOF/oVlii5xc0PvuqekLzcumrwYzxS+AV7JBl48LmxTiTAY5Z1z/0dnCexZzX
         te3x1ru1jzhr7bokih/eN7fTeNnIquhF3UGvrzv9EMvBu3+s1R4zU+eULAhAT6ur2LuC
         /01jusfLLLES5YQIZG56Ayb//ob6t11j9FB7zB4OUsOcwpF9C74AMwwFwtM3geIOVsQA
         9VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709313755; x=1709918555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37WDRV9x4Xm24khamq/oQN+S82VH6v/HallOiNR2z8I=;
        b=dwYON1EIikC16ljo+vdJAxBUHpBNGVzeJVPog+u1Vbk+m1zPR8rh25AAODXaMQ5Rf9
         JPIAYA1k+qN2ZCRnNwYC9OzO8swx4zw7SeskLgycpEQN3kSho5zQDzp7ZOo/4LvklCv3
         piC0UMRSnUfDIbEuSXeP/dfPGaBIqTeSOHFTgrZtLBg5n66dvIUCyt0MRY9i3DBYMtp6
         ZHxO4FlomEwbX9+6EyLV10ecfePGz5hdAKkhLC+ccxxSaDr7t+Tao9V+yw3HQU8+e7zK
         /z0N6rGsO6HgNYaJ9bRR+u0C/r6P4B1r6Wq8Pxzxd5BU2lg4/icXnmotxx7BBBTAX3a4
         U5kg==
X-Forwarded-Encrypted: i=1; AJvYcCUNB3gTJXpn6SwHx7mmvrgZWmBjuV9qFYCI58h1rYwM1fmKAma8HQnaaf0nfplroQUgrf3TaeRdeJP0I2Y/RS/GU1OqLlcQJJICWuw=
X-Gm-Message-State: AOJu0Yz2fAoysq1BfK63eAliG+bySe08wvcb+i/2glwRupeGpkSbXxtA
	9HTaQJw82o2VY4B2173YThbA2qNNHDLp+/WyIQZZwLUrr0yyiDOV
X-Google-Smtp-Source: AGHT+IGtVWAQft25IP1iqNWRhDEMUGcaRacUUSQk9h+swOPYRkaoHEXxo+JZvWLEqXKiNPyGToM3cA==
X-Received: by 2002:adf:b649:0:b0:33e:1f2b:a468 with SMTP id i9-20020adfb649000000b0033e1f2ba468mr1578174wre.24.1709313754549;
        Fri, 01 Mar 2024 09:22:34 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d5052000000b0033cf4e47496sm5013576wrt.51.2024.03.01.09.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 09:22:34 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jernej Skrabec <jernej@kernel.org>, arm <arm@kernel.org>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.9
Date: Fri, 01 Mar 2024 18:22:32 +0100
Message-ID: <2203755.NgBsaNRSFp@jernej-laptop>
In-Reply-To: <3990c5be-6173-4c20-96ca-79e22cb4a40f@app.fastmail.com>
References:
 <20240223210408.GA9248@jernej-laptop>
 <3990c5be-6173-4c20-96ca-79e22cb4a40f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 01. marec 2024 ob 10:54:41 CET je Arnd Bergmann napisal(a):
> On Fri, Feb 23, 2024, at 22:04, Jernej Skrabec wrote:
> > Hi!
> >
> > Please pull following device tree changes for 6.9.
> >
> > Note that this is based on top of fixes for 6.8:
> > https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git 
> > tags/sunxi-fixes-for-6.8-1
> >
> 
> I've pulled it into the soc/dt branch manually, as b4 refused
> to pull it because it got confused by the text above and
> assumed it should pull from the fixes branch, which does not
> match the commit ID below.
> 
> Having the stacked pull requests is otherwise the right idea,
> just maybe next time only mention the branch name rather than
> the URL that can confuse tools.

Sorry about that. I'll do that next time.

Best regards,
Jernej

> 
>        Arnd
> 
> >
> > The following changes since commit cbec657208bdd4bff4ff31cac5924aa18817027c:
> >
> >   arm64: dts: allwinner: h616: Add Orange Pi Zero 2W to Makefile 
> > (2024-02-23 21:02:51 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git 
> > tags/sunxi-dt-for-6.9-1
> >
> > for you to fetch changes up to f4318af40544b8e7ff5a6b667ede60e6cf808262:
> 




