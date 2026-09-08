Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31264FB9AE
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Sep 2026 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881246; cv=pass; b=XyFzblJFOUfveYmB55EnlppyEUPxzOVedRffe79pEjw/eXv+MsPq9aJTkm4XfiepYRjlRzsMSGgAK3M1JmuhexOsowmDCZ/qiaeemtASbWdaZkWPWFV4/xSznR9eRlU1Asqamhh7Jd2k+h72IwizDXB09Py4pJl//6KSKTqll34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881246; c=relaxed/simple;
	bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6Elt0fC3h8r6BcotxzcL9hBc6Z1vlNxfXiPYz/uMMCZyJGI7Jj2eEbquB1rE5Eez6DJs68GgvlTVDtumHPfnxjq0Epdm7aqSmcBZT0FgJUuQKERmaQAzfa8VLFec4O0Rr0w6zWQV/l3yLfN87uHXdkhqFYwJhz6gGta2BpfwEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOw+eJk2; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOw+eJk2"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97cad2f51edso1317439241.1
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Sep 2026 08:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788881240; cv=none;
        d=google.com; s=arc-20260327;
        b=qkY4p6EWUv77ziuRsx8qKOWwRrvIYL2CSlgexa/6E4YUdlSAoVX1pgGd3VhUme3QhX
         9Y7F2vv5xQ37OMYae68WUDjEbF/bQx1kxkAA4JYVT70POLtOEe9lLDtu304SeqMVZJ2W
         MTN0Q0jYm7P0uQOq70JHvpXRaP4Mqx3jGC9ERg9yL6vcN4CnpEKmXFd5+4iXsEQGP1oY
         1pa1arapu4RC4IBzpgP5o7UM9FJXcmJMhDldi+R1c/9GHnxJ3iK0rndwwvnOtNg18rIs
         A4Z6hpEffGTWNSfSxlj3ZXOk0e2ZTnyvJ78dm6P0Hy+FtLUB4o/Q2umptSDo37ID2Ctf
         Z3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        fh=cK0w135c+kG6QLtLwY6I6CMmC55QMnYQfz9IvpntXJs=;
        b=XCM+lKzCZtXyZt9h8VW4jgbXUofUco/vNC0RiGWTBwzyKA8oCK3X7KSOFsGp90+pGT
         7r44M5GXyMZ8zjesERs2BGrqED8aHpfAOB+E9Ra4YY3r3lhu+UxI3Ojl7Zvmi4z5trPZ
         dzwLG6R4Jrx7c+IwNH+51fNMbmBSFWZnZrpdhiA7qyG5w+T9LR8YutwsW4bK4bGN59gr
         6Ax5wLbqyFgT/UCy/IBS9zWAqtP7q01PsneQh2kD8j01QmlXKEbn8kVkhuLpTIM/EFHC
         ZbZAdyysyKxeU+/74AxJc7WaKJrq4b5c4tkd3Bty7LGB1AR3B28vWIhb0pY7O8g6ak6h
         6yWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788881240; x=1789486040; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        b=bOw+eJk22iN03UavBXtjkxXv0df1YNYwLUckAxtcfcUYFlVyfVMNJqRrJlSe6P3m68
         c0YCjb6kEn0o1BXvruufBLvJ9CsB/ibl6SuLrU0ZboI0Kan1BOAs5CdTuSS6INNxMMZZ
         hmoc+ae4KhbG2n++thN87w1V45iu0AWBKpyKqXfj/QcsfV/oJXvR20vwAfw/RjgzAWGf
         oSq/GgKeYfXokIGXIzhxTrkz3lJv0+BxD+CudhgVaQOB+cTztI7Tn2ZTttl2jt3+M+Nw
         YWAqQFkwRECUc6Ly16ol5mEkxKIjOCGMFLsv9moXjMpgExemFlPpqYV4XbSgkjWZMPMt
         371g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881240; x=1789486040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        b=Dv2C5Z9CUtKcKnCU5tzMOBPpCue93T/cTHd4AcEfvrcqYQKHJCScxpAGk590iKqa2S
         o8JqJFjmbrfOpgtBNSqW7h4IrKCx+s9fmh2JRRXFjFI27DBOeSHJLFDM5dxe2A927iHy
         7yDYMHXkdBebkUcqF6xbUFfK4aYhOkchqfn4QoeOpRaJTYqbOo/ckE2L23Ov7bKQEjOh
         /FqqFfC8BFuukV3Q00mwY/2tTzaX4ZWO9t0c5KtNH982OOe7jxlMyhVHpwYhp7HuHgc3
         L5CnCbsdAdx+JfLJ/HZgYrokhBBXPWwm+YJy3yJuhQZIEdjDht4b5tFUuXeAk/r4LHDn
         l1xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxesLrn8cCc4RmQB0N9fXFeoYfMXNeaD/2DOY8KJqoSQzqJswuQ5xLBOz4ccuDvnXs5bzCayWsPc8fzOg==@lists.linux.dev
X-Gm-Message-State: AFuF++mpIsLPaSH+gVoiff9ZhY6Jq+M/FWK0+GcF1V+Q5WmwfqrQMrZk
	4B8MglwCH/yz66Awe3RlwSWoAemkZPxNYh1ikiSpECBek0+IlBX8TWiVTRtX/3H+KKMXEmHMI5V
	Gv92HbSV3Ig5yZQQwXczuTBBgh8LmfLM=
X-Gm-Gg: AYBFou18+ntTzY6kagOZp7R+x6GZzgTuuybBwU+Jk4YBeK1p/ccULCB/tQ7e6WBNdmW
	Ptr2tmc/XEXwprqj977L413aq0PSiZDZ5dCOZvuwwBFbVZag3irMrIPWQa6g8tOm0akPbstFxQy
	zOG5bDwY5jEm5EDkMxI7lYkHSnXGRUhOojhr0ASBlnh/oqxjifh9F2PyBVMSTRsMZxfvA6DfQYz
	zYnv+cSZ18f0i1Q3nj+votW28aMz7JlSuzi97wABTYpJZyp+ohdFNg57Z8HM4reWJe78C5aV9cE
	Uyj+iZGx4GVOVj85CBLU1X8jomldLiXgldLxtOZp5zRL/H/RN1xENpmsgh8dh+wo0PY/WjDelez
	EsVJE9h39DkoZTZUG62QejxqRdQINu0IU1bdnAKRBKyI0rorX9IMgD+XwlmOsA41ptLWeUWW8A0
	4m6aceikVdRIChIMhHcHuWuSClCWJcY5xaupA9Yw==
X-Received: by 2002:a05:6102:3b05:b0:78f:7135:b4ff with SMTP id
 ada2fe7eead31-78f7135b567mr108498137.2.1788881240558; Tue, 08 Sep 2026
 08:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
 <87zexst5ze.fsf@bootlin.com>
In-Reply-To: <87zexst5ze.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 8 Sep 2026 09:27:08 -0600
X-Gm-Features: AcwNN1XTfSZyHBIe8pqnaVApbMCPBzAi1LuuzXv-U_kf3BpB2aghA9-Ue90Qud8
Message-ID: <CADvTj4rFxwgYZgKzcHZG738UV0_94gxG1Dhy--ET9jC=E1dgoA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: fit maximized ECC step to page size
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 4:03=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hello James,
>
> On 04/09/2026 at 16:39:27 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > When nand-ecc-maximize is set, the driver unconditionally selects a
> > 1024-byte ECC step. A NAND with a 512-byte page consequently produces
> > zero ECC steps before the available OOB bytes are divided by the step
> > count.
> >
> > The older sunxi NAND controllers support 512-byte ECC blocks. Select th=
e
> > smaller of the page size and the preferred 1024-byte step, using a
> > 512-byte step for a 512-byte page while retaining 1024-byte steps for
> > larger pages. Unsupported smaller steps and controllers without
> > 512-byte support continue to be rejected by the existing checks.
> >
> > Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> As reported by Sashiko, there is another use of 1024 down the road which
> must be modified accordingly. Although, in practice, 512-byte page NANDs
> have disappeared for quite some time, so this is a theoretical fix more
> than a real problem.

Does the v3 I sent look like it should work?:
https://lore.kernel.org/all/20260904-submit-sunxi-nand-ecc-step-validation-=
v3-1-931cec317c10@gmail.com/

>
> Thanks,
> Miqu=C3=A8l
