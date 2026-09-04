Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EC23E3DAB
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539493; cv=pass; b=u5jQ/NKSt8U/Y9b+hM3W1zwyzduNLgtzistxjW7UGEQYogrrYON+3RfMKCfMX6xTk3E/UL4GDVBfBOuHnol8/imv3VovF3+7rBmR4YF6uxDJFiu7pyDPSuspZaKJa8uTQMNaWZE+ZAzIcM+xH/N9ENYQ1D0yMiLgcQNtOu/MP7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539493; c=relaxed/simple;
	bh=1TYJoC2Yz6/I6r6pmFu77YT+lJxpcBafXKju1XdltGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xwrjm4zG5WpbgIFDnRox3gwlXsBNsvDN29n+wS2D6sXuat0NfQ91nqLck7vESvSJUCp2aXcTp06EuypEztz1+Z2SPydu3uIt3e2QNO6ZmEvZr6guQXms5ndvxDPqqZJ/Qlw6EdIeNJnHirFGBZErFeZmQCtbFSONHOW0WLvOSVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1jIPnqV; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1jIPnqV"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-96723c7151eso370612241.2
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 09:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788539490; cv=none;
        d=google.com; s=arc-20260327;
        b=S9tl6BFZvURWLZR7vWkLXv1caZ612iMhjQFCh0lo/tCTjsoALYyPfk94BRQHJSFbsg
         5uI1YOU/aK0TYXZYDRycTfCfi0N5KVnfJgina0HjLQJwasdV7prYO58TGW141uQqu459
         pMy/mD1eu+FQOSefI3T+Jg/8N0bRvBvNSvey6QTf+zNn8AYY7RgPJeMwTtHm0Z7I3JTG
         Xr4LuIUDlUYXyMfg4+HEMhMtSDMG6Yg17uhlcd5AKRkb0TH0k3U3tc8lYjjjfPVqoFqr
         BHLDEJ5ieXeFlmQhXJ9rgfr0SLZbG5lIM73X2kPhe3PdEkg90QXRKKIlAb17cd2yqx6W
         aong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        fh=fPsLf5TclrBb8SqBE3INB/QuuJyM6hzjKlUf4X59Gu0=;
        b=K3PcD4EWh1EXhcyWwtb+hAurX2LmNz5VwXLR/+agXLVGZ0WCzdp9fyGGxCnFo4kFh4
         fwh412ZxsPO4xK5WBQWrqO1iDYA5nxUDjemD6a85ponm60W+zU3lhefOnBT/CHct1Lly
         VtVtvlNK2OZOwHTffFnLkCMoaC1WItLBrR+J1ADoYWF/2YfaKGiXDJr+BAMzzWrEhq7Y
         sDNwLmTcGof3ZIZXIXlaOA7OJnZh42XoNpSlIJREDhFsm55uVJV0wydx9s7PtkP9f32P
         0sF1LJfL8FcCvuoCm+pLMdkkN7vMpA1NYrMzY6BkV2mJNr2HbHmJsvhrePsyyHSrNQen
         bQ+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539490; x=1789144290; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        b=g1jIPnqVMrqIT/0Q+EB/r27UHAu2E4aXuIlvSysS252APOPo5ayLGDqANX2bJ9aghc
         U+rY39E/ToAn60A0CCvJVnpRdNVNJyoUOwea4oNkRrFEK2xw52MZPGoo5CjLZ829l5pX
         2qFgNCTrznIjpk038Pop0ocNYFGowJGUWdvVR7xdJY411uD72/3wXCaF48LvlPeS1XA5
         SUrwlVRiiu1zYFy1VhOxwrxNODMuw/KYYrKuzz0IDnUv9b7IVUg6i2+S7o61vr1L4Rk6
         DbeEqwz9iw3YNmk3ibii7kAegy/f5+9cgw4MU+o3Umgn+UhjcTYcFFcn9Bk1gnOJyfmb
         /x1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539490; x=1789144290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        b=NtITKrGNsvCho9JnXqqKVWcAeUqdzOHF9bIGIQEBsKL4dsM2jTO3fiAOUzXsz0An4k
         KGq3g4AAnxPgSX+DNu+RP0iG5o8gDJ/FOYae9eCAwv2xw0FJax+ZpPWwc0RxmTURqh2C
         0yWWmPqYn1+s0uO8nLy7cTfDyaspkVS3+UKUHJ9eruNufEze4mlX5Mw48E5XYAuHXWKS
         JD5/Ocn755BH0Eb4xHPZCtOg6LC7vM0hScYuqobKvCjyccsyH7HUsQifOM5U6fdRYJj0
         OeHFKH/S2VNLtErqZBfPGXey4xDJTRSnJR0RqVNUT9KTe4i/wRQGCKPK9FBZL/8GU9Yy
         sgYA==
X-Forwarded-Encrypted: i=1; AKwUvBw8QArT0UTfH7N97v5QfceDC52AMMi7BfnzskRCrelcq6hjwTjabZOoD0CBjhgsDViJWXCv3zV/tKJp7w==@lists.linux.dev
X-Gm-Message-State: AFuF++k8MMUI/Rml0VokDfEG1+B1iIGAsdjlf4FSLLA80tlH/ZfEcx4S
	Vyzc3qvEnuXVQYn+O24HQP6DM3+qG3bVGaFSCA16QVuVOTcpQQIYiqCwAfy5c33NZLRMtz8etQA
	KB3/eoSf73SubjHuoT7rXEWVAF+TCUzs=
X-Gm-Gg: AYBFou3b0fdcEQcjMb7+sxtuiG/4wpD5UsazY0vZUKSXD+G1OgkvyMixEPABnd1uK9H
	s0KirRNSHMte3NJrHnYhdnZsPz9S47zbdxVGEDgHcx81P+rk0nNVUrKYnJdlmPY5gNG6dskIRCe
	Q0Iw7nfwqN+x07OKM2npSudrZyYVQvYFgwdTXu5qUoACfdbgEI4pEG1KOKTKKIFMCfwzHawqzzs
	1uO40CEBFyVXX7un1qfMelvYs1cHSN3Kxaxf7Fns9UvxmOTna4MzKl3C99CYVMMDNdMszu0dWe6
	ezjJqShiW7oNKXBhlJ2O1kR9RYmSXf3dw9i29iZPizR7hBUsBa1Z8DUZL0Hz5ipZ2h6ozT5lgrM
	jYi7D3OddjP7NVyGyEB9shv9AxdSW94D/4/3hJL/EPdVPqDOJWsDzN5K3HH16z07UuZij1vrhUe
	CwWHYvh7g9uTFpRvF6Uq5ovnsDukBThLZYilGFcldNe2rlMyGSfw==
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id
 ada2fe7eead31-78a4a6f61c1mr2282968137.6.1788539489982; Fri, 04 Sep 2026
 09:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
 <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
 <87se3p13jy.fsf@bootlin.com> <CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
 <878q5h11gu.fsf@bootlin.com>
In-Reply-To: <878q5h11gu.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 12:31:19 -0400
X-Gm-Features: AcwNN1V5YDZSFNMjnzJoP1G8O-i3NIxVjKyBABCYlVfSDwIJgBSeFv9BnhDuMNw
Message-ID: <CADvTj4o4Rwcmy7ByuBcpcPkcXctvgB8Tuda2_7UV1v=vx7JwRw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 9:27=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 04/09/2026 at 11:17:46 -04, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > On Fri, Sep 4, 2026 at 8:42=E2=80=AFAM Miquel Raynal <miquel.raynal@boo=
tlin.com> wrote:
> >>
> >> On 10/08/2026 at 17:04:50 -06, James Hilliard <james.hilliard1@gmail.c=
om> wrote:
> >>
> >> > The controller randomizer covers the bad block marker along with the
> >> > rest of the OOB data. The driver currently compensates the marker by=
tes
> >> > before writes and after reads so that they remain plain on flash.
> >> >
> >> > Allwinner NAND firmware instead stores the marker through the
> >> > randomizer. Media using that format appears to contain bad blocks un=
less
> >> > the randomizer is enabled while reading the marker.
> >> >
> >> > Honor the allwinner,randomized-oob property by unconditionally enabl=
ing
> >> > page scrambling and leaving the marker in the randomizer data stream=
.
> >> > Keep the existing plain marker behavior when the property is absent.
> >> > This changes marker handling on all supported controllers; the H6/H6=
16
> >> > protected user-data placement is handled separately.
> >>
> >> But I think the reason why this has never been done is because it just
> >> breaks raw accesses, including the BBT reads. I don't think this is
> >> handled, is it?
> >
> > From my understanding raw access bypasses randomization entirely.
>
> yes, so the implementation you propose is invalid, raw reads shall
> show the BBM. And also, when accessing a BBT, it is made in raw mode,
> without randomization, and hence totally fail. This cannot fly!

I may be misunderstanding which raw and BBT access paths are at issue,
so I would like to clarify the expected semantics.

The allwinner,randomized-oob property does not alter the per-operation
rule controlling the randomizer. MTD_OPS_RAW still leaves the randomizer
disabled, while normal ECC operations enable it. The property does set
NAND_NEED_SCRAMBLING, ensuring that normal accesses use the randomizer
when the NAND does not already set that flag.

The property instead selects the Allwinner firmware's physical
normal-page OOB representation. It leaves the BBM in the randomizer data
stream and, on H6/H616, selects the firmware's protected-user-data
placement. It does not change the randomizer algorithm or seeds, nor
does it enable the randomizer during raw accesses.

With NAND_NEED_SCRAMBLING set, I understand the current mainline sunxi
behavior as follows:

ops.mode   fd mode  ECC  rand  main data       OOB with -o      nanddump
---------  -------  ---  ----  --------------  ---------------  --------
PLACE_OOB  NORMAL   on   on    corrected and   de-randomized    -o
                                de-randomized   logical OOB
PLACE_OOB  RAW      on   on    corrected and   de-randomized    unavailable
                                de-randomized   logical OOB
RAW        NORMAL   off  off   physical bytes  physical OOB     unavailable
RAW        RAW      off  off   physical bytes  physical OOB     -n -o

OOB data is returned only when the caller supplies an OOB buffer. For
nanddump, this is selected by -o. For MEMREAD/MEMWRITE, ops.mode
overrides the file mode. Stock nanddump exposes only the two diagonal
cases:

nanddump --bb=3Ddumpbad -o /dev/mtdX
nanddump -n --bb=3Ddumpbad -o /dev/mtdX

The first uses the normal ECC/randomizer path and returns corrected,
de-randomized main data followed by de-randomized OOB. The second sets
MTD_FILE_MODE_RAW and reaches the raw callbacks with both ECC and the
randomizer disabled, returning the physical main and OOB bytes.

In current mainline, that physical OOB contains a plain BBM because the
normal write path compensates the marker before hardware randomization.
The normal read path reverses that compensation. With
allwinner,randomized-oob, the compensation is omitted, so a raw read
remains physical but returns the BBM in its randomized on-flash form.
A normal read returns the logical BBM with either representation.

I do not see the current BBT access paths selecting MTD_OPS_RAW:

- nand_block_bad() calls chip->ecc.read_oob();
- scan_block_fast() and scan_read_oob() use MTD_OPS_PLACE_OOB; and
- read_bbt() uses an ordinary mtd_read().

For sunxi, ecc.read_oob calls ecc.read_page, which enables both ECC and
the randomizer when NAND_NEED_SCRAMBLING is set. The internal BBM and
BBT paths therefore appear to receive the decoded marker rather than
the physical randomized bytes.

Could you clarify which BBT path performs an MTD_OPS_RAW access, or
whether I am overlooking another path?

Also, when you say that raw reads must show the BBM, does that mean the
BBM must always be stored plain on flash, or may the raw interface
normalize just the BBM while otherwise returning physical data? If raw
access must remain entirely physical and the BBM must simultaneously be
directly recognizable, does that mean the Allwinner firmware's
randomized-BBM representation cannot be supported through the existing
raw NAND interface?

>
