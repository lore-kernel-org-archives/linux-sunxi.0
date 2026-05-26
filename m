Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EDF3F8701
	for <linux-sunxi@lists.linux.dev>; Tue, 26 May 2026 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797823; cv=pass; b=hE0xIYbUM8lfVc1mPag1B+NmilHQkOtj4Tls0yHnp/IspeOqiPn1uNQnGU4eMlNxBS+unLkJropt9fEHosvyLZGlIbwR16l0cX3oAEgZ7/ybCY/XpfA+EovuiWE+WSITy7P3/BV9w1BCunG+hogxBELmwsaiAiG65Mb6mEqM8ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797823; c=relaxed/simple;
	bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ahv0vzOHJK0g9Eh8wNRcI5mMmED6bgGE+JeV5MCP0Bfw3EXo4q81HNsK2IHCJ7k3CZB04D6dcqSa6/w2fgC7YMIAxSKVCiiShuNLjOkrkKWK8bRGWDbQ5qn1AhZ5yobgaL8FFznNR4yHu61Wduns0bBiTwUQBnmNUaxs0m0Ye4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmANo5I9; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmANo5I9"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36ab8816a35so1292610a91.1
        for <linux-sunxi@lists.linux.dev>; Tue, 26 May 2026 05:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779797822; cv=none;
        d=google.com; s=arc-20240605;
        b=lWK7uVmg2PkBxrCzRt8T6iMvuq12mHsRCCSN7uuyxMymkNG+BWP0mTsvQ8CLfwG+kp
         IFUhB6jfuTa3n+9AxUW/zpzmRfqzDcKHz8nbXo63JzhiiDi+pFpQdVBuIlouuD7oZFDt
         MDzFMk1PwG8a79J0/RfXKvyufX1Ui7KnY2BjOotC/X2Xz3M8xNbzxM9ocmTR0foa65Xm
         IDYZQVrmZaFfM22IHpAJNl41AyRKKMjHwMhN1K+3fij3iShvsDwLM7AhmhkIE+o3Na0L
         OSDa4/B7sJuSJdTWt2ImnmPrH3msHQsb4OyviST9Alz7EXy+bevDUrGwqZOGaSG/3m1b
         EVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=;
        fh=riBl29El5b0c/bNIl1NRMqUwQBY4mSsWPTOWsz5vpaw=;
        b=J6Y7olF7tnc72u7mjDqlgTEmmr1DGA09TkMNO0G3CAEwzHWfVYhuvu4eEAO7xMOY7N
         JT5K1eAxEVdFn2OUkEj4THrlPunVl5duzVB52RfCxWL3MiHMY6czCFc3jpX6eEsEE6I4
         vAzfY8j5YBN1IqZK4fQQAH/oviBw+gHK18By8l8az6llqzGtsLcT/2z9Chy/WXHebFen
         N0qvs4wxMoC4Y1dtPon3xPFCalWaV5SPBnngX3VP2YMD06BTsWc7wafGZtxzBTRWJ+ig
         sgXUmRNEkqO0ZIyN/2/rzum+mjOmsYjd3bW8YU7lkm9G+DfRIcgDpXAPZHz3p6z+6vNt
         gnOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779797822; x=1780402622; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=;
        b=SmANo5I96iw2c3FYu455By7fm6vtyPLANi51+rxYbUnHSYpAxVphRvJkpS2LkC2UWb
         rxn12jimi2LiJREUDd12jWVIJfMjr+o//SQNUkTqI4MLLnwQAyKBQIf1Q0qfSGIj1ZDr
         jPf7haBWFZ4il1ouG5BFQuLGBw/05HFqITAX4FiPYHtdA7Fp7BuHLo3gibb3RNM2Z515
         1tBviI25kw523HMhKO/0XJzrY/jX9b3agcbp/Kny2t+o6w7tMfxGObAlyWVCnTVeI7Fo
         1eSfaQx1Co7xmdFiV7RZfeQAdoBJyTIDMtFxFUv05lbGngMisKoHC27YcUVILoTZhpll
         ysDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779797822; x=1780402622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=;
        b=V4hy0Vn4dVCF0hd6GjWy5LBqOKKK+0Y35eVgiQtNZG4RIcYR50akztug+ZbUYfghpO
         YKCl+TNzpT9F8oifXptAUS75TXQcqXB/0hfMmOCfu0RW5wC6Wj5kNDJU1+g4/Zozc8ri
         sphG4fqRL4EN29L0k9KMGnWDoGQd1UzCrbyj+mukOANDoXlBC9/5ShbnXvAd3j8tn4ZZ
         Gl5tiYtmW7mIbxDMvANS7wtKikfwf8R4ScCPJajwXPIq9MD1xnPgvetYTvaaAo/Mvq1c
         R7ZPm3nyic7AnEQ7Aw1oo+KdoaeuBQiOHw3Yybs5viyVL5rVg7E2gEE79LZOZ4OvivYW
         Inyw==
X-Forwarded-Encrypted: i=1; AFNElJ+5S+xofyUCuUyvuDXDeQYQHuBis5Q/T1SeavixX7Lz/gfy8oe1iNZLKqw4pDhYTHb0rQVHRkqrwV7iZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIh5rFBFHYoplstAtkvioIWPCBnxTEfrSmTwZ9pjTY1vOkw+bK
	f+MeEpdkm/pxJtLL0LpRLPmTOi56vtrbtjUPuumI1XWOj+5sqT+vXiSLM7ftqbuxbCUouxZdYkR
	RmeMeOGfGyNsYk0GgbNt1puZEiWi1oFk7k0t8
X-Gm-Gg: Acq92OHJrcNqd0vsXxCeHty/PpS/6RhBCt4yqUUn7tTjSYUHClK9zO2OqTzjvpFTBp6
	gvm4mR3OTL5kDIEiECFMywh9kJiOcMypkvVzhMntSnABey+2jt6AMwZ0Yl8rgcT2jLVlZFxgdRH
	NFeHbhkVLPVn6by6OPNowQBCCiSN3dbBgWxuDS+6tnmmIonm39Pudk0D2JOfkOG2aJIK4coOIrp
	vNjnvhgqLw3JzCj7mXRyIbMh/lDSHi5X2eRbjeB6SUyOfJ64hXbVEUDghUOx44KNDVcKBwHpB0O
	naKN3fzPk82Ok0vfuvxBzi4jGLpUCYvz72szVAXacgp7rEuhh6TK9LXwelCXFAYuckhZ/JyH
X-Received: by 2002:a17:902:c948:b0:2bd:2de3:5181 with SMTP id
 d9443c01a7336-2beb034603cmr207644055ad.9.1779797821644; Tue, 26 May 2026
 05:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
 <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
 <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com> <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com>
In-Reply-To: <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 26 May 2026 19:16:50 +0700
X-Gm-Features: AVHnY4L36KKu58qpYxsDJHrLwpA0fiNG3V0fNQatxdA3GV3-2n0FXUky_32u4G0
Message-ID: <CAABR9nEsKjgErDB3jnHrx=dOUajvvN6GbP+6XUb5Ay3VYYjNJA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chenyu,

> When you submit a patch, it is expected that you already tested it.
> If you only compile tested it, please remember to say so in the
> footer (or mark the patch as RFT) so that others can test for you
> and the maintainer knows the status.
>
> And if possible, provide a scheme to test it.
>

Thanks for the guidance.
I=E2=80=99ll clearly mention the test status next time.

>
> I can't say that it does. But since the only control that SPDIF gives
> is the IEC958 status, and that doesn't appear in the standard mixer apps,
> it's unlikely that a _user_ will trigger it. Plus the control was added
> after the basic structure of the driver was done, so there is definitely
> some possibility of a crash.
>
> But what you wrote in the commit message doesn't match the actual hardwar=
e
> behavior, like I wrote.

Thanks for the clarification.
I'll update the commit message to something like:
"The kcontrols may access hardware registers while the
device is runtime-suspended.
Ensure the device is resumed before touching the registers."

Best Regards,
Phuc
