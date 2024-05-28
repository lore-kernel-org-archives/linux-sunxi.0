Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879A016DEC7
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716912411; cv=none; b=UaxpKNMcbJVpnOJFA5+78VofflRPsywvHKQBk50aWQlh6H6jUPdhsAAPyBIGwOg5NuLodnBiJs2KdIDaC/c17jiB8sSpSGNz5yRQwYZTzplRCnZMLyTiI0A4fqIUf95wUNrAoNaFcRIgoXmKqLGveer3z5eSu2tA3GCqFzIuNDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716912411; c=relaxed/simple;
	bh=Zpd8VaZ4kpve3RgfgE7Y6EHE5OBche0E0cu/WMORRHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWurVj4mGH17DtF/bIeLQBtXwxkSRSlYhNvbDXiXSsRhB9SSWKBFeLPD1Uw8cEBse3dYTETQZXNApvPojM5n/Q2d3XGDd0z7olZc6k3AiF41yB50l0Y+RCp+RyzS8/6PvkyJge7PveLOR92yMQte9V52vSFDu3o5Ut/fk+L+Po0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso13803551fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716912407; x=1717517207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiWUEGRw3sA0Rlo7cpstCK8d71HbP2QWoWmJdKUJYOs=;
        b=riXbk/ju2nmWTCgYlQHlTYuvzN07lq5z5FSkNzGgM1ogOcO5308n4pLZVwyHFvSa0F
         jqHoIH1TsdCvpgKKqr+98jFE6oC5zgRxlDNiz+6nUkBJUTUV7UIP7zDfo5iGQuqe1RKU
         H4xUkGphu1vZxAXF57WDOLNVbCdYU8R2ZgyQa83tIkZfsBW76zX59IJ2DVE/QbzLMCMq
         Aaq+QsrptWlB2dSXxz2akwqz2O9Cxms36xsmyN1JgIxvg9TchCMGYWvneDI6ybArKmy7
         Qkdvn0yEjoC/qyCpZgn4wctS8CVRBi7XYHjQz9qW4rZB3MzlDw7SH7q7nrldBcGi6rRm
         vqhA==
X-Forwarded-Encrypted: i=1; AJvYcCW/tWubFDg1eV93KZPZ6TjI3tgxEO9CE3Hqo+yf1ne1DC8WCP6bfjk++cWktg71h/Yv1Ry/+ZFWb0MtQItptLq63HDWk5JLv+nqOxw=
X-Gm-Message-State: AOJu0YxJl93PTCZNBcO1Km5JkWcMwLR5tF0LWh+MXHZkZG5iiL5cX+0v
	zHn8dHjYxbksgh83ljZaqYqJh+zHaSb9uILID3QKoJFEBjuPsSF6fbVd5MhB
X-Google-Smtp-Source: AGHT+IGXdd9rfO+7SXAmRs0emsOidRmuopbokAVsperMcWPbIqKdlSkiAyqTf1DJg+V6xaLvMd6VuQ==
X-Received: by 2002:a2e:bc08:0:b0:2e9:570e:1cf with SMTP id 38308e7fff4ca-2e95b3089d9mr95852651fa.52.1716912407138;
        Tue, 28 May 2024 09:06:47 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcc4929sm22758691fa.18.2024.05.28.09.06.46
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 09:06:46 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so10446351fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:06:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLSYe+Ar9VHufhMoUGl+d817j5FWosvGwp5mTiHbLpczKnJXSnIQnC/LwCId27jViQcgNytAJ0aUb8LLI4Ekj7qN/XETIG0M9MEIw=
X-Received: by 2002:a2e:2e0d:0:b0:2e9:5966:790a with SMTP id
 38308e7fff4ca-2e95b1cc478mr74542041fa.15.1716912406795; Tue, 28 May 2024
 09:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a772756c2c677dbdaaab4a2c71a358d8e4b27e9.1714304058.git.dsimic@manjaro.org>
 <49abb93000078c692c48c0a65ff677893909361a.1714304071.git.dsimic@manjaro.org>
 <171691117471.681554.6744393893618279840.b4-ty@csie.org> <CAGb2v64ETOtHxQf1D9n+c9bGivsRTC=O8swDru+2cX2UT=o0qw@mail.gmail.com>
 <803a939c62b3ac4ced7ac49f18efd723@manjaro.org>
In-Reply-To: <803a939c62b3ac4ced7ac49f18efd723@manjaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 May 2024 00:06:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v66vFh4twtsT_ZojGe14k_kvAm8Y9AHBRikDLp626u8iOg@mail.gmail.com>
Message-ID: <CAGb2v66vFh4twtsT_ZojGe14k_kvAm8Y9AHBRikDLp626u8iOg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Add cache information to the SoC
 dtsi for H6
To: Dragan Simic <dsimic@manjaro.org>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 12:02=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> Hello Chen-Yu,
>
> On 2024-05-28 17:56, Chen-Yu Tsai wrote:
> > On Tue, May 28, 2024 at 11:46=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> w=
rote:
> >>
> >> On Sun, 28 Apr 2024 13:40:36 +0200, Dragan Simic wrote:
> >> > Add missing cache information to the Allwinner H6 SoC dtsi, to allow
> >> > the userspace, which includes lscpu(1) that uses the virtual files p=
rovided
> >> > by the kernel under the /sys/devices/system/cpu directory, to displa=
y the
> >> > proper H6 cache information.
> >> >
> >> > Adding the cache information to the H6 SoC dtsi also makes the follo=
wing
> >> > warning message in the kernel log go away:
> >> >
> >> > [...]
> >>
> >> Applied to sunxi/dt-for-6.11 in sunxi/linux.git, thanks!
> >>
> >> [1/1] arm64: dts: allwinner: Add cache information to the SoC dtsi for
> >> H6
> >>       https://git.kernel.org/sunxi/linux/c/c8240e4b0fd2
> >
> > OK, that's weird. Somehow b4 thought this patch was v2 of the A64 patch
> > [1].
> > Looks like they are threaded together because this patch has
> > "In-Reply-To".
> >
> > Please avoid it in the future.
>
> I'm sorry for that.  I noticed that back when I sent the patches to the
> mailing list, but didn't want to make some noise about that.  The root
> cause was some missing configuration for "git send-email", which
> resulted
> in adding troublesome threading-related headers to the messages for the
> individual .patch files that in fact were correctly created by running
> "git format-patch".
>
> Do I need to resend the patches?

No. I figured it out.
