Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AF0172BBC
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716913092; cv=none; b=IKfDzv5wmECrJE/Xk+M2bdgi8BwImTvUr6a6XmLy+3PAtCrvGUq/ZYmN3ryRykBI8dWB3y4uq+bf67INZAljTVZh71vbO8nPsq1dI+rWASSUFGgpQrUGgWNAgmBdKTNbVZ0WaK269KJdJOIsTJgT0ZkiyUmwxpnAfXAnuKMvzZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716913092; c=relaxed/simple;
	bh=qI/O/I/DKZxbnPe7MGquyE2ged/XjP50eQvro7VPpYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UX/YpHVCHPzfFazz2+La7f4clZubEoyITeTKt3KkblXlY1s1g8ho1t4vwmh0rhrHLzT5yizvy9B7tXnY1BamiymRtI+461D/8km5lhbFgzP+1h6JX+L3vvwf+Oh8cytGZu26vMIryBIYWoPn55iyo79fkS4Xyb2PgNbQjgBnUNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-529c05a8982so342375e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716913087; x=1717517887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c+cf9wMPn9ILQsVI8cmlxBX9GAhWkPtp3uNOSYd5ZQQ=;
        b=q3DcDBJDuKw5rPpMD7m9++djdubJeV3yaWJjUDFfgRKkHPeZjJOoMKQMknZsLTi4oc
         iwRag02htiWrQ5Mi7UX6YAtaZ8npA+6eP+O85zXVx4QD3HKV9/J2H+74zVwF3oJ/PN1B
         1OZo+ZcPa+7JsmbhuKRdE+nliIxA7JoqnWnCqUEV0kzMFQuuW5sDdhITrUHmc39gAfSp
         XJ/6o+4c4nVRmPky5yP0cmincgXk+saiznwT/qWVYxSxtlhmY5cYWvI36+3q/OFH6abT
         6UzAp6p1TCgHPmz6V9pJdAVBbmqmAzHIBzzpB3TeHY4oeInTwf3E8FCIoTWWO01J3kiE
         MMEQ==
X-Gm-Message-State: AOJu0Yze9NAesMWoFuMN8z2srZuq6APsoGMPBttoa5kB+Y5mVgK2dtgw
	0Eal9JMX2YukhTmllRB9yrAOV+paIEgE9fLbtLcfEpwNOdiLaUq0ZqAiMI+L
X-Google-Smtp-Source: AGHT+IEkcVdoUEQVeUtvAbKxRZ1qPMg5DJXWqNUe2beBhlSeJ1tLLQ1i/VRjelBkRLEPDej3w9KoBQ==
X-Received: by 2002:a19:381a:0:b0:51d:5e78:17fa with SMTP id 2adb3069b0e04-529644ec060mr7115049e87.4.1716913086975;
        Tue, 28 May 2024 09:18:06 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529a6f3f1bbsm721577e87.273.2024.05.28.09.18.06
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 09:18:06 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e974857588so10905551fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:18:06 -0700 (PDT)
X-Received: by 2002:a2e:9e45:0:b0:2e1:f38c:bd63 with SMTP id
 38308e7fff4ca-2e95b096cc7mr68621711fa.15.1716913086334; Tue, 28 May 2024
 09:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a772756c2c677dbdaaab4a2c71a358d8e4b27e9.1714304058.git.dsimic@manjaro.org>
 <49abb93000078c692c48c0a65ff677893909361a.1714304071.git.dsimic@manjaro.org> <171691117471.681554.6744393893618279840.b4-ty@csie.org>
In-Reply-To: <171691117471.681554.6744393893618279840.b4-ty@csie.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 May 2024 00:17:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v65+A2QUN6TWrKiOcgbTenYT7h=S3Ee1xEUN0e6vQCbgFg@mail.gmail.com>
Message-ID: <CAGb2v65+A2QUN6TWrKiOcgbTenYT7h=S3Ee1xEUN0e6vQCbgFg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Add cache information to the SoC
 dtsi for H6
To: linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 11:46=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Sun, 28 Apr 2024 13:40:36 +0200, Dragan Simic wrote:
> > Add missing cache information to the Allwinner H6 SoC dtsi, to allow
> > the userspace, which includes lscpu(1) that uses the virtual files prov=
ided
> > by the kernel under the /sys/devices/system/cpu directory, to display t=
he
> > proper H6 cache information.
> >
> > Adding the cache information to the H6 SoC dtsi also makes the followin=
g
> > warning message in the kernel log go away:
> >
> > [...]
>
> Applied to sunxi/dt-for-6.11 in sunxi/linux.git, thanks!
>
> [1/1] arm64: dts: allwinner: Add cache information to the SoC dtsi for H6
>       https://git.kernel.org/sunxi/linux/c/c8240e4b0fd2

I had to do a quick rebase as the branch start point was incorrect. The
commit hashes will have changed. Rest assured that the patch is indeed
merged.


ChenYu
