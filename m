Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE4E10FD
	for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748304996; cv=none; b=mQ5YdAU3mUC6FSNUor7EHNtreGSuNMFT/95bHjgGOvuxgYBlc8S3V/5NA5We9oOdSft8h+hKLq9r2cZHFmdr9eUTPtvOFzSELy7UvfW9XQi3FfInoeGdGWzk44LZ0RH+skAEYU3kv0JcJ+k5rn818jagz6MuDwn+NhUEhYTh2+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748304996; c=relaxed/simple;
	bh=oIVrYMYQVGQ0H7rAxEnKQPj9zoT4OSei4WPqmdSh5G8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHDZf44OAq9muwMeMez6y08NT1sM8OPge9rADClKmS8OE6GLlBDuDWfZOvlA1rkPh28/wabKa7qdmGj6uuxU9YQOvT5u57oi7XvfFTvM9Zk1bndEsh7Rm7aqynQ1wyofVn7m95Z3BHg40JdXbitvI5+/WrTZJgfZuiPtEM0jYvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkT15/h5; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkT15/h5"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e11ee95b2cso1718747137.3
        for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 17:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748304994; x=1748909794; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOcEbDk1qfiDcX5DWviKvVm3NUschFW/SlGs49rdunw=;
        b=kkT15/h5Ku4uTCek14QgEZ8p1DjedyMhPr4nZwB2FpVWZ3tCyjlR486uMp61QY2bT8
         cJX7G2Iu4zyH7A1Fk/y4bnzH9d1lK9bJnhuc6lzakqiJEcdiMiANxC8EdspJKMvz+frl
         MXbXM+b7xHfTLnqlOdCD0c63Gvhka2c7T3mZVmX7T7YhY1w1H/iGSJYJW88eFRXq1xAu
         RJ8LDWUtvKCDNMxMiKGo3syp4wi7bqnd1HYZQPy9HiuUqw3uyHMss4sUkf/FG6g2tXH6
         wpnRou+9LIOznfYa30A9ul5l7AORZyM0kT7RcxiTYpEnfNNOFe3QUtDqqKVCYN8XGUfF
         ACdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748304994; x=1748909794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOcEbDk1qfiDcX5DWviKvVm3NUschFW/SlGs49rdunw=;
        b=mH2GiFdHGb92JYiX8m4sn4qaRJSThLtdXF9dwoSyD18XjSaGYnMUU3nwmWCjrJPSQC
         vNCoBjM667paLbCIhM4UJQugKPOnD3C9mpCkKgfsHEFnDyiQ5nzeIgyOKCacaXHUplsY
         4Ueh0SebLHu4/YrxNGHHSH3kRtHs10aq3rMvZZKbyC9q3j5Do737HMA0upEVRqZ13phw
         swkdfce5a/iXykKDltAcqIbmG/7dWnKzf4FMvWnwX69Hj4th0BacW2L37kfU5nURcnrG
         ZbHtaPG2fPcxF3wqwFexBbn1waviEWHYYakd4bDObJSR97gPIkuZhrMNs2BtTZAHAJGL
         nUiw==
X-Forwarded-Encrypted: i=1; AJvYcCWeBTCCzSnKNE7Azs0SP9brf7u3X36D8Ni79fLMRiBzgmMt+qhmoSTz9isaHwsFndSXk/8Yy7q/ARMQaA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5j+uQ6KkLU6mJWDoo1foUEbH9b+c4TxL5/PcDUEA/tURBjCG2
	YJtWOngwlI8I3l0eSkOC7wKgYtTmsYNYcVt1SXzk14mP4euyx8QhDd55Z3FHBNK/7WTLResHMTG
	fsJkTlC11BiqQqueRzSJ+Um81hpHHctE=
X-Gm-Gg: ASbGncucL09CNFmt/y8QnHSDvel9JscK6QhtQCu/iAnt/oLYrpfyTSUuJCQTRK79tqR
	jxvYHzcgDMcoTq1YCuSUEM8E0L0sxaLwrtXs2Gk4EWzna6iWPkDTBLDyid2pPbm9s0enUybZDU4
	pu8l00wY/7mjGZMY8Iuqc9ZbWoNq/8txyf7g==
X-Google-Smtp-Source: AGHT+IHSdJELAoc1OfbG1X3kZVb5ldqSTuSeYhI72dMXIJ0HLefmckoLWqzNnulr7EDgBDJ6rEKu7PIcDwC6U64zr2w=
X-Received: by 2002:a05:6102:cd1:b0:4e2:91ce:8cad with SMTP id
 ada2fe7eead31-4e4241911f0mr9215317137.24.1748304993817; Mon, 26 May 2025
 17:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-3-james.hilliard1@gmail.com> <959e576e-bf36-4d01-9ffb-023931b61574@lunn.ch>
 <CADvTj4oqjCkMeK0p8ZBa8PQmctc77hpiFK2pqgBJaxRFDgQoDQ@mail.gmail.com>
 <d4109cc5-83d5-4acd-b0fb-39a50043060b@lunn.ch> <CADvTj4qdoD-mo7CxNW8VitZf+wXTiZ7m28R4JPQ9kQJGhUH7bA@mail.gmail.com>
 <d9d0881b-12cd-40af-bb22-d84236d2e04d@lunn.ch>
In-Reply-To: <d9d0881b-12cd-40af-bb22-d84236d2e04d@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 18:16:22 -0600
X-Gm-Features: AX0GCFsNBL9BmJB3bZajN52hoBf0v04Bs4dxVYW5eiTI4xBSNVhcu5-DVu6exkM
Message-ID: <CADvTj4qZz5q7x3_+OB8FiSnkEehzzjikVcCaqdcwHDYesMzpWw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 5:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 26, 2025 at 05:22:48PM -0600, James Hilliard wrote:
> > On Mon, May 26, 2025 at 4:38=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Mon, May 26, 2025 at 03:32:03PM -0600, James Hilliard wrote:
> > > > On Mon, May 26, 2025 at 1:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch=
> wrote:
> > > > >
> > > > > > +        phy-mode =3D "rgmii";
> > > > >
> > > > > Does the PCB have extra long clock lines?
> > > >
> > > > I'm not sure, it's a copackaged(maybe on-die is the wrong terminolo=
gy)
> > > > PHY I think so I assume the clock lines are internal, in the device=
 specific
> > > > dts we set something like this on the emac1 node:
> > > > allwinner,rx-delay-ps =3D <3100>;
> > > > allwinner,tx-delay-ps =3D <700>;
> > >
> > > Those values are just weird. The RGMII delay should be 2000ps. 3100 i=
s
> > > way too big, and 700 is way too small.
> >
> > I think these may not actually be required when using the internal
> > EPHY's now that I think about it again.
> >
> > > I think phy-mode =3D "internal" would be better, and just hard code t=
he
> > > delays either in the MAC or PHY driver.
> >
> > Hmm, would that make sense even though the MAC driver also
> > supports external PHY's?
>
> If an external PHY is being used, i would not expect a phy-mode of
> internal.

Ok, I guess this is a bit of a separate issue vs phy selection right?

> > > Thanks for the link to the old thread, which was 5 years
> > > ago. Hopefully since then, a bit more has been learnt. Quickly readin=
g
> > > through that thread, i don't think an MFD is not the correct solution=
.
> >
> > Well the current patches I've been playing around with for the AC200
> > phy are pretty similar to those patches still.
> >
> > Here's a branch that works on both AC200/AC300 but only if I do
> > the PHY initialization in u-boot:
> > https://github.com/jameshilliard/linux-h616/commits/acx00
>
> I personally don't like depending on the bootloader. I often replace
> the bootloader, because it is a crippled version that does not let me
> TFTP boot, does not have flash enabled for saving configuration, and i
> want to use barebox etc. I think it is much better when Linux drives
> the hardware, not the bootloader.

Yeah, I'm just using that for verifying the PHY selection logic at the
moment is functional and that Linux can handle the PHY's once in
an initialized state. The initialization sequence I'm using in u-boot
is pretty far from being suitable for upstream as well.

> > > In the last 5 years we have had to deal with more chicken/egg problem=
s
> > > with PHYs. It has now become pretty much standard practice to put the
> > > ID values in DT, to get the driver probed when the device does not
> > > respond on the bus.
> >
> > This is what I'm doing right? I mean I'm putting the phy ID in the
> > DT for both the AC200 and AC300. When doing the reset driver
> > for say the AC200 I would wire that up to only the AC200 phy
> > node and not the AC300 node(since the AC300 reset is MDIO
> > based while the AC200 is i2c based).
> >
> > > The DT node can then use phandles to the reset and
> > > clock controller to configure them as needed, the core will probably
> > > do that. I2C is a bit messier, you probably want a phandle pointing t=
o
> > > the i2c_adapter, so you can use i2c_transfer() on it in the probe()
> > > function.
> >
> > Without a MFD or some other node that exposes a reset I'm a bit
> > confused about what driver would actually issue the reset.
> >
> > Yeah, we need a phandle to the i2c_adapter, but since the resets
> > would be under the AC200 PHY node I assume there would need
> > to be some sort of intermediary driver implementing the i2c reset
> > right?
>
> You need an reset controller, yes, but is that an MFD? Or just a reset
> controller? Where does this reset controller live?

Well at least the AC200(the i2c one) appears to be a full MFD:
https://github.com/DeciHD/allwinner_docs/blob/main/mfd_xpowers/AC200_Datash=
eet_V1.1.pdf

The AC300 appears to only have EPHY related functionality:
https://github.com/DeciHD/allwinner_docs/blob/main/mfd_xpowers/AC300_User_M=
anual_V1.0.pdf

> Question like this show we are missing the big picture. What are all
> the different parts, how are they interconnected? Once we see that, we
> can give you better advice.

If you look at the block diagrams here it should hopefully give you
a better idea of how the AC200 and AC300 PHY's are connected
on the H616:
http://file.whycan.com/files/202304/V85x/Linux_EMAC_%e5%bc%80%e5%8f%91%e6%8=
c%87%e5%8d%97.pdf
