Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64DB3BB12D
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 03:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528360; cv=pass; b=K21RzBGPy/e0ZmSLsNAWI2DMVZ78rXK8PGEXVK95Qw6DMMul01FNdqR/urQdgvZSAnhlJkt91Lt+uDH1+xScvSErX/ImcUCoF4NDh3fuG48oQocTFTt1CjFe5iOa4T3dk7HUdFFPIISyc3FagvlR9POVpzWmMFvSLhn4nk8oh8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528360; c=relaxed/simple;
	bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K83nmnKPDjRgdwSHL5RiVMhiVU3MzhBKuoAc6DTJzORaq/d5eQXGdwD1VPvi/3ee5GNdF4KL+ZHqw6RDlDjAqQQqlVEk/EQhKkvkD5gY91roINSj4R/1tq+eyQPysYTnpBsn/yJr9nEi2/wzjPvWdMxLetCmqOgB5dqVRjPnBtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQBVxoUG; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQBVxoUG"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e53002bso256337e0c.0
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 20:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789528355; cv=none;
        d=google.com; s=arc-20260327;
        b=hzdCuQsDQQlLyExIrL3sJFHU9fyM/MBv/IYUbuWcohbqQQbiQN6UqwwKcRACzDLBa8
         aFIwLjxx0xxTIVYNevWgcho+fDtspk4CWeu4EGV8MzkjfNgF5TLrY/VYdV62VqLASp8C
         zh7xJGYMbHMyH5vFbwu8REmWhggrCEx72F5KLyTtEJGHsGtN2r1PzR359abEb238hGAC
         Q768t3LN2SseUV5AoOvVQrm1UdDat2Rm97svC7zIuXhT4dWHjeU3AvyDCIgxcnUdXgqW
         uuo+JYUtfwXqHM3K6zQeetK47GVMfJevt/5SivMVLmeIKcrl49J6OnjTVwjSvnkdEW94
         Ix7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        fh=y/LG+dkdL6JqdqXBtGTd48ezNhWG1d3ptpVZncRDj+0=;
        b=AJGDsiGOFSBbsv5wpxllJGW4rDd3y5KrpcrSX/PVZD6Ph6HqM5D1x6Gnbx12a00l0c
         EKyN1CFtQNVwimaEvLENBj2hU3vFatgePVVP03BQtv1ZTmCtyzZudyec1Q41VvXi4lNO
         SJfgJ7Go9zBMMSCHD0XM/SMuSjWpcNDO8W4wRXYlAYN2kLNhNTU8UENmT+Z+pKK88e7G
         lz3O/srlC+eUD3uvXrr5hv4RDaythMTMbUuozu9eS3TItDkIehEyxXnGLgAi7cEylokQ
         dizrZxdXdhvUMPj7KM4ufLo7mRWDlM1gcNnVzbaGfvpnaUIQXrSNbg2Ahzi1gXiR4c8P
         qaHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528355; x=1790133155; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        b=OQBVxoUGvvhYtWxSQorB3C1IJ0XIzcO7R8WtEGEmEHlfJLAYbfXC2jMt8N3JJoGibc
         qZEgg+fNGtLkQgbLcAVchkyQza9if2dMfAchAixBIsE4jqnPtwEIX6tt52n7qxXzo3NI
         z2R3PYswFxyPM3eB7dnYfI0392mLHYUAFJnoU3WSOHKfE2e9jLEKpooSpNS8SUWVDI7V
         wbnWIc4YHSNLFyZ6Hm474fcefu+lkvvDvmL8WLUZqfUZNoxV1wAd7k4+mxylKyBpQ1aq
         +xR4vkktTStZ1SrqpgBMFm5r57mJlIWd1mhnuCvmi1ZlMCwlgAEY9VLnJm1iKt8CBdTs
         XijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528355; x=1790133155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        b=IXFtTxfwtGOvLyL2uzJxGGzGUkcSmAcIV70Ig1rDjIybnALoRT8TQHWiooMLcbq3oy
         lgWrl/+4+9tXIx90gsTf2B2XlzS39jcUjkCTg8msZk4nv0UI68Jb5mUQETt6L5lBjFFy
         HyGkprsTqy/sHNbCzig6uh+KKA2jC8cobIBWoWaImVEEBqokzD9dV6v/91eoxJNBQ00s
         /lCfGbe2soOGR9+7MHZjM0SuuM9TeHcTO0OKvPajkSAGUsYEJeucRicyXpsOLw9Pg2Xb
         onA7eZddNLsBKZnuLiGRKFbFQGkeA3K6kt4UwGNcy2bpOyU89wOrxMthzrHm50OvdLmE
         4pBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwStu63Zy7FisBXDOPrB0zmbscqgdo5vAPqTiR+0JyfMmkUjddcm7FPdLceSqGkJ7ksOO2MK/PwGDkxHA==@lists.linux.dev
X-Gm-Message-State: AFuF++leZiYNFR77UDXtxpYl8f7yZxfMWSNDVkbK8fA5159ACkPm9tvE
	ZcxdcWjujTIPsoj9QTOkoAFaS1lruT3sCijn9WHM01WwqR8/B0nMC1WKFnWKUF1QF0+j7lkdJbo
	iJUfVUGJTGQ87i6/WscWuqpWCIK29/mM=
X-Gm-Gg: AYBFou15S3J1iMZImreQKrXxOCOh07GhpFtinQpRt7+GLc5390qnmef/ZaQWJYWzxu/
	rLSHjdh8uJd7q33yyjKxhLCMRFomfuX9bf3W7dR2XQo/Rc3HcAnLQ83VZocq4t3shJRj5wXi2ad
	ZJ4Uw8F0Pef0T/Uwa9Ivv7b4SEJIGgvk0DPQzqyZBsaQs+Np8CcqpWXVXTEIqfhHy1YIduQE4XN
	wmqfbhFwrQjLTPcp8iiuWXYJLrQ1/jhTtYj9ynFUF9kMdt/ToTSrSQsDh/hD02AxVyVtxSb6Esk
	VZiuIm1SVRqRWamX8SAvIUADujEYiJKj3CMzDRPkP+RQDBiFWuPS18CKZN0plC2ipMMzJNTMGVf
	7HCe+fhXvg64DW1LmE1Ia/0287kTdDfV5b1jTUypHRnT06q+h2yvQH+4SJ7QkE66sRDUOnTQjWf
	toAjSg4LyLcWLcxiUDWfXwXa+k0xOO3n8qkq94kLFVREe/
X-Received: by 2002:a05:6122:8b11:b0:5c6:64ac:d6f3 with SMTP id
 71dfb90a1353d-5c99accf34amr894249e0c.3.1789528355167; Tue, 15 Sep 2026
 20:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
 <20260915-submit-h616-emac1-v1-v1-1-195de0bb1f8a@gmail.com> <5df35a3e-d2c6-4576-868f-d3194de3deb0@bootlin.com>
In-Reply-To: <5df35a3e-d2c6-4576-868f-d3194de3deb0@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 21:12:22 -0600
X-Gm-Features: AcwNN1VnOu-2I6GbVq8WQF9CNqEg1e8Y093roZVmrwYp1oBZ-wfj7f7of1XAwLo
Message-ID: <CADvTj4p6RRcr7jb5hJCveeniHC81gkzHxLrPA0T53+VVUrKAZA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: allwinner: add H616 EMAC1
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 2:33=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi James,
>
> On 9/15/26 21:03, James Hilliard wrote:
> > The H616 secondary EMAC uses a separate system-control clock register
> > and supports only RMII at 10/100 Mbps. Add its distinct compatible
> > without an older fallback, since using the primary EMAC clock register
> > would not work.
> >
> > Constrain the PHY interface mode to RMII, matching the hardware. The
> > EMAC1 clock register also retains the three-bit TX and five-bit RX dela=
y
> > chains, so allow the existing Allwinner delay properties for this
> > compatible.
>
> I don't think there's such a thing as RMII delays. RMII has a single
> clock, contrary to RGMII that has a TX and a RX clock with a 2ns delay
> between clock and data.
>
> I think it's just a leftover in this IP from the other variants that
> can do RGMII ? You should just be able to drop the comment changes here,
> and same goes for the dwmac patch.

Yeah, looks like most but not all vendor driver variants had RMII delays
configured here, I did test and it doesn't seem to be needed so I went
ahead and dropped the delays in my v2. So yeah, seems to have been
just a leftover config.

>
> Maxime
>
