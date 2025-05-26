Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53F94C97
	for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 21:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748295961; cv=none; b=MtiHpUvDV76tYIrzQwRMr+d7gOSb1PYCMkngluQPJEfc4GDpijmhLnYhBeip5cO5JwYtY5vVeO6EPSqQUOKwD8JcqHcONzztJf77PNK8Vh/uP8kfPfp1PuY/YIrJvVrH9pFemAqIVXDy60kvSfNkNJZ8QrkG32/+Oh+HFmWsM9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748295961; c=relaxed/simple;
	bh=/IH4DYCOkaSE0nxb9v7Wn4qg7ALcjOOJbsMAOSjnx5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dnvj3ejzsUB2xPAVfhz07eS3jC6G1Iwie9yq5COuNz+cLa+30p3iKDMdMJ/GuRnmIUmKUfqSnLqYEKftDLNYwYxGFp3ZBqqsOMfB21a7zCXMQTNjF9Y+xG4JrBPXWt/fmHnkwjPXAc2bN9hkETpysgQ6DsrzOEb5yddzDngOtgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XM3cuuAa; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM3cuuAa"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4c34dcdaf88so818171137.2
        for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 14:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748295959; x=1748900759; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19reQAH/JFXrmKGSfsIuVcMSe5tUTaIhAmGB+5EzAyU=;
        b=XM3cuuAae4Jb4geaRa6xQ0Jnn17qH6Mc0cKe5i57tKU/Z9uPV43QogREsXEHsDYkFq
         JlcGMhVoaXknDaO0VJDMxqd6SYePk5g5tniL0AskHQjyzL5+5qVf0Xwys/OAhilxqj0x
         YX4AfaTwgOhQdSDvD/ji3w+okJfe5lYInUt1hx+QeTbIX/ahFrocDQ1C8bVcjMvyRmp/
         T38+s34jQboJZyMeiM6wQi8dblXe8zI5p4qc7FIUnERW1xyLBC7EHCA31blvmgUb8K1E
         JDw8zqYctiSxCbKZwuw2WUaJraxsOGSsr1icDrP4iq5KoM8qUCs54G1IkUIr580351S6
         2U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748295959; x=1748900759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19reQAH/JFXrmKGSfsIuVcMSe5tUTaIhAmGB+5EzAyU=;
        b=K4t4Q1ZiTF1KHbuaxUMuI3n/2sXLcgUgZ2IljtGyXQpYjVKxII+a4RgOlZsJE+R/79
         Jdbu3+EKZdqGRYe+YRYRrLxg5trFE6WtgsfWp1jzUb4wtj3d8Rj/pt0yarHJBHEButZu
         d4ABeS0Kh1qq5RG4OdpeK3sXJlBWIK2iz6VzVYIfbpXnVOTKCxiRr8XdtAQr+NrtyWe+
         oBINCwL/copYZvx9dc3Gb0mLQ629FdP68NADJeV01r8yWzHBZnaboEZTaqK9mIIbBl7S
         /am05uE4TUxMx5vxfvB41FwfovdtZZdSF52zytGRNMcKUyw30JboWxZwPwuAjfHJUHiA
         /gWg==
X-Forwarded-Encrypted: i=1; AJvYcCXdGlymk7uZ1F+/bDkfVRMU1Cz5fYrF0Wxk0ccK4NLYiTNDCXQ0WGP4ZvT2vvCdxQjLyB+hCIlbb4TqRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKkTVtlu4b7pCPr0Lk6AMZ0B/EBqssq0R+ELKvcXYeZ042FgsU
	1r9EZcoV37f8oV1b70cQZK8mGJAk6WTJ/vJTUVAHxyb2KUWLZKOMM5rNQJfxSJEfRKU4vRlQUbd
	MoPGT91BIF585ISGKH2ePSLNriDTSw0U=
X-Gm-Gg: ASbGncs/UVkmZPXIegTVcTwBHb6NiIfiNXolcdXIWFv0DGtnOBiWPzGBSUJjk/o7oVM
	tR1rWE/8nL5cayTV4/XCrA9beEUpwrD9JI6ZzK3g2Bc1IebNz+lMwslUzxx0vG/anTjW0lZxCSl
	hIOP31aMUbUoY8jZ6aFHR+3stPF1K3iJpJfA==
X-Google-Smtp-Source: AGHT+IFotR6RyxU/ifwJ8AmbTwSsnUIU6QL7qlKuPNmt94jWJ9smNJz+SAYTONBfXHAq+tKlLbtbIPgWrf25oFYgN6o=
X-Received: by 2002:a05:6102:5244:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4e42415fc45mr7977719137.17.1748295958811; Mon, 26 May 2025
 14:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-2-james.hilliard1@gmail.com> <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
 <CADvTj4rO-thqYE3VZPE0B0fTTR_v=gJDAxBA3=fo501OL+qvNg@mail.gmail.com> <5b7bf54e-4838-48b3-a357-70f117674523@lunn.ch>
In-Reply-To: <5b7bf54e-4838-48b3-a357-70f117674523@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 15:45:45 -0600
X-Gm-Features: AX0GCFuEfLkt9AfTQ9ECVkRYk1pIwbklJGqsNyxbFKVvoc0OdxtNfymBf0iJQt4
Message-ID: <CADvTj4pt48o0wm-69WfkOtp0c-aP64DSwPFo=znY2Hk_N2ft1w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Feiyang Chen <chenfeiyang@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 3:22=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > The normal way to do this is phy_find_first().
> >
> > Sure, but there are problems with that approach here.
> >
> > The initialization sequences are rather different and the devices
> > won't be visible on the mdio bus until after they are initialized.
> >
> > The resets will be specific to either the AC200 or AC300 so we
> > need to choose the correct PHY based on the efuse value rather
> > than a mdio bus scan to avoid a circular dependency essentially.
> >
> > AC200: i2c based reset/init sequence
> > AC300: mdio based reset/init sequence
>
> O.K. so you need to post more, so we get to see the complete
> problem/solution. It seems to me, AC200 and AC300 are not compatible,
> so should have different compatible strings. That might be part of the
> solution. But it is too early to say.

They will need to use different reset drivers but the mac part is
largely the same AFAIU. The mdio part is similar after initialization
as well I think.

These are the vendor docs(I only found chinese version so far) that
have some more details on the AC200 and AC300 EPHY's:
http://file.whycan.com/files/202304/V85x/Linux_EMAC_%e5%bc%80%e5%8f%91%e6%8=
c%87%e5%8d%97.pdf

Translated important sections:

For AC200:
ARM communicates with AC200 through TWI, initializes EPHY, and then
MAC accesses the MDIO bus.
EPHY, PWM module provides an internal 25M clock to EPHY.

For AC300:
ARM communicates with AC300 through MDIO bus, initializes EPHY, and
then MAC accesses EPHY through MDIO bus. PWM module provides an
internal
25M clock to EPHY.

So the MAC to EPHY connection is more or less the same AFAIU,
but the initialization is quite different.

>
>         Andrew
>
