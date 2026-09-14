Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38647366567
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 22:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426152; cv=pass; b=gxJb99dCrlbq0yCK06N1WOPtkyt5TaDHX5XYFHitBSHT5PAxbW+dDh+1QJQiMQAwvlTrCyASuTj3oO+b39PZI0E0xzNUiyJqo8OiPvYuNIQ11D6SeknwV369VAl9nwzjO/4AZNd2NQLCn3GVyVnZFhFiAiPmem44AChYTKGg3Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426152; c=relaxed/simple;
	bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nd4M06M92mvWFHM+axTw+WOSi6lL9Z+a7xtEYKd7R4gBt6Qh8cc4mJZPf3g8CX+7BCCbX9QvXKQhmISZOdikSNMJLLvKVTL0jiK3mNi0TwEBY2UDCgTqJFk/p1iFMHgT5DxtYX+bFCVNU6P4GaJ3w8wTm0QFlAAk2fz0dzSXCy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvWX6v+E; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvWX6v+E"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c663437fe5so2234515e0c.3
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 15:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789426150; cv=none;
        d=google.com; s=arc-20260327;
        b=DZsZ/IUeQd9ZmWjtn0/VqjSVpVogt81p76nWFgipYhxteNTiz5TlLkeEXD3B5BQpUr
         4Gt1XImdL65OOVCOopwP7t6juen2OJ/BQ4UrCLAy3JK0t/FeMVQ4i+4V1lictQ6JNe2V
         +JdvYMTT8BcNPz9uMHRa63q6TClaqsb6yNlTeqh9/ksx1zUkiejcyGNaVlIT4LStBt0W
         WelwL6hjpmp01dmpKSC3cYkmp4yWzli5BssQoWVb1uD627TJdTuhKn97zJZLk7VWlvaY
         85KTU+g3tvbDB8nJP01yp1d3qfUrVsCEAr1OOv0leI9b0UW/Sf6ORdzhLDSiIpapG8mt
         D/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        fh=8HCW8vefKd+Yy4ZytQNNFoM/T9PXPipyJU84REMg2j8=;
        b=m4DPPD2bES9NP6vh209hBfH5hIqPuZDSZ8KjQbVEAi5ujvpslD+SLpXKKEZxVx/2fh
         e08eS5M6bElP/50WsWZNttrwRB9qx8QTA9Jc8im++N4TvNikJBE9RDsuHF0jCSGen4EN
         MXyjjOvw3zZMJQYfpaG4L1334sffF0oQSQHiduMVG8dVDThZMC3PXdcT1aLV7oA/ZT6c
         5TytXCH7cESohwUpuupzHSmWoi+u/F/Zl8dbjt8/eWoeJCxbXCraIVSWTj+na0zpF/Y8
         i9ulgAzbCKdmfGx91NjsB5LzuwHPpPxA0ge1Zu6zgjoejKRe7jqYRCT1Ays4MCKL29G5
         1zFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789426150; x=1790030950; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        b=HvWX6v+EKJ3nTabNPFUpI1Wl/8yam3gxEAjU4v0X/1D5wxVkQb6SQFKd14dEeyw4TP
         U8YERmM0Xz6267yJa5XsVQTZaZ76ly52yLHdxlEtRMVt4RICXVtuF0ISuJyD6EnjlvxR
         ioLxn/mg/3zCe4HzQ7737sRFQ+/32z1Hx/EjRWjmOB/wnHduBHgA4BPk6D5IgI2UkAC6
         NMHKmx9wqh+t8pXGkkFxu/gDCPynF873EDoKc/W4wd6w9ipMwmM26P9TW3r5bNi5bzu3
         YQTdV9bfc4F4Pt/6Bbh3Rmd5/hK60vfQH6ol+WV8Pow2U8859sgXmHwITStDFmSlIa2Q
         6oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789426150; x=1790030950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        b=OM8OS5W4ywnlxDhtA6FSNjFRd56gM46K5PdRF5CllocQMlO3EPwbrg/xKMxX7rEUJ7
         59aaVegZ2ldVjFu6F2fREMG+xYqBUolYmR/ekgX6AfOhiDzYrLwSkIITf/TzUG7SQrO6
         Ow/bXfVnzRiBG0s3BzoBEJIhau5AtZSCjutL6hHcnNdNw6h852qY3zsQ0ziXh5VTW4I1
         ZHfW4jR+jLbuCg7CzE7uqaG6BhCLC5XMoMRlkzvmUzwyunyasQyDHBW4S8eM3tGD7gTo
         nnXdPW6EPHdHLY83CQaz5CUDa6zB1VhRr0D+Ub/tDmOFKHTuo3HC+/Lfzc7ZYrLA5uzG
         ElXw==
X-Forwarded-Encrypted: i=1; AKwUvByj1t155Zwym8i8vzQ4cf/GYWrSKU07LthbLWGsAS/2BhVMrkD0H+tQoMa2kKPNoR0BYIuZ8Fk95s0VDQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mcpnvZBg5AgA/DTFF3kixPhc3+rsKPlrwJcy5SoD/61wU756pE
	Ssq0s6fH1TKVUh48gOB0cEG5yNcMRdSpMSfxYXjcH2rUmqrlv/cJ4y4P4KaP5lyZBCN10zRMaAd
	gG1vscKBi1ZXnx4MlAK0stb4ATnOhH+M=
X-Gm-Gg: AYBFou2/3q2ZQYBhsaKu2VdDrHW5g+sWTS+rP5OGuqUynQvSwaZWkUlS8AkUM+uE0SB
	OSQjB2DHPJq3m5FGeYlfRLL9cCczzBADi/4DlxT6QHReF0AwK5//b0No4WuWITpwma9AneDEPrW
	1A3r/2U6B4AWyei4UztFlyc9DSNKjd/HaV3dD7xurttLw348qS/OnENGKKj60pUm3CVi0216Z5J
	+xMWBcyZqLULt75k8eo0A7pRqvzNTXPGrkikpPlMeHpta672Aa2yvYRo6qsBgSLpIZUk7dZ0TLN
	2ALh/dnbCtqZNWwbfOpn7iIQRKnzsWnZ3zwyHLYTVgNNjLABjrqXHQ+B0MemwsgJRzm7/tWHmdc
	uJGZjJYWFp9mk5IW4Gsriviv3epUwBevqI74T/mj9NSfcSmdT0RTt/BvmUdwuRi8X7c4rSIkBtj
	nAkL4pHa2+r3ZLreNqroSJJPCH7lprJfgL1W1zwUReDrzv5kro
X-Received: by 2002:a05:6102:4492:b0:77a:d089:3dd8 with SMTP id
 ada2fe7eead31-79b60973580mr409096137.12.1789426149941; Mon, 14 Sep 2026
 15:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
 <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com> <87ik4fu4fh.fsf@bootlin.com>
In-Reply-To: <87ik4fu4fh.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 16:48:58 -0600
X-Gm-Features: AcwNN1UlC9FxjgijfoClAvZzNG8RBzvUoNkXu_nF9VDV4LFTu4fZlyRKfp3tTWs
Message-ID: <CADvTj4pH8KvTmsxOXO8JQYCQmKf2OA__eqvYXrM+1=vjq0368Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 9:51=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hi James,
>
> On 04/09/2026 at 15:22:12 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > The controller randomizer covers the bad block marker along with the
> > rest of the OOB data. The driver currently compensates the marker bytes
> > before writes and after reads so that they remain plain on flash.
> >
> > Allwinner NAND firmware instead stores the marker through the
> > randomizer. Media using that format appears to contain bad blocks unles=
s
> > the randomizer is enabled while reading the marker.
> >
> > Honor the allwinner,randomized-oob property by marking the NAND as
> > requiring scrambling during normal hardware-ECC transfers and leaving
> > the marker in the randomizer data stream. Keep the existing plain marke=
r
> > behavior when the property is absent. Reject the property with software
> > or disabled ECC because those paths do not operate the controller
> > randomizer.
> >
> > MTD_OPS_RAW behavior remains unchanged: raw accesses bypass both ECC an=
d
> > randomization and expose the physical representation. The raw-NAND
> > core's bad-block and flash-BBT paths use decoded accesses and therefore
> > continue through the hardware-ECC/randomizer path.
> >
> > This changes marker handling on all supported controllers; the H6/H616
> > protected user-data placement is handled separately.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> I believe it is still not completely working. If you look at the error
> path in the read functions, in case we face a factory bad block, there
> will be no data, we will face the "page is maybe empty" case where we
> still address columns like before. Since data is randomized with these
> accesses, I believe we would return errors which will not be interpreted
> correctly by the core. The discovery of the factory bad block markers is
> thus broken during BBT scan. But a BBT read is also broken, because even
> if errors are ignored, we perform pattern matching on data which is, if
> my understanding of your implementation is correct, not de-randomized in
> this case.

The erased-page fallback could overwrite the decoded buffers with
physical randomized bytes before the core inspected the bad-block
marker or BBT signature.

In v6 [1], both PIO and DMA preserve the main data and protected OOB
from the original hardware read in randomized-OOB mode, including on
uncorrectable ECC errors.

Erased-page classification uses the controller-specific vendor
spare-byte heuristic without a raw reread. Accepted erased pages
return all-0xff data and OOB; all-zero physical pages instead retain
a bad marker and an ECC failure. Other uncorrectable reads retain
the decoded buffers and report failures through the ECC statistics,
so the core can inspect the marker and BBT pattern.

I verified this on H616 using the actual NAND-core BBM and BBT paths
through PIO, DMA and forced split-DMA reads. Signature searches
retained the decoded pattern despite ECC errors, while table loading
rejected an uncorrectable primary and successfully loaded its clean
mirror. Correctable protected-OOB cases and BBT creation/update also
passed. Hardware validation is limited to H616.

MTD_OPS_RAW remains physical, and the existing plain-marker
erased-page check is unchanged apart from the prerequisite
error-handling fixes.

The series grew because this work exposed existing bugs in the shared
PIO/DMA paths: error propagation and cleanup, IRQ/completion ordering,
OOB indexing and program-command handling. Those fixes also apply
without the new property, so they are split from the format support.
The final patches are separate optimizations.

[1] https://patch.msgid.link/20260914-submit-sunxi-nand-vendor-oob-layout-v=
1-v6-0-2fb084fe0751@gmail.com

>
> Thanks,
> Miqu=C3=A8l
