Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DC53F0AA8
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102865; cv=none; b=LpMClVD3tHX3ayNqsjERvTlvAcV5EucOtnxfCQSR1FD7qA0Lfkkfy8cW6RhC/DWdMG0LbZ8MaS/pAwydGsuzL5nJRVFMWed9tKHHfxo9J6T3HfhdSybaRLoH/sMUoSGooeiTBpVZZIK2u+5q2yhmCkxn5m8/7a4Mv5y3kAMqWOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102865; c=relaxed/simple;
	bh=xPCsA7WPQLgdqLkZvHFipzspQZKQXHRJJOvtbGbz9xU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kiMlg40lqAbud7EbZMtQKgya7PO0ymaduz7Wp4q5cuZuWtv3uthq1hdW5U3794i3qz2icE9Cv2sQf3YE2no/EhcwBBmO/gdEMNv3GO+LsVAHDXtIXI4Wiw9k79ispXq8O5G8E+7ZgJdPmi2IvTFJBU3cgltuGIPzt1WTqlzGALA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5PsebpD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5PsebpD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED13C2BCB7;
	Mon, 18 May 2026 11:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779102864;
	bh=xPCsA7WPQLgdqLkZvHFipzspQZKQXHRJJOvtbGbz9xU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=p5PsebpDx7eW4jNiRxPhrPxd/rfd83PQM/E5qbXQqYthcXcswMtXYgiIBzkLmE8zK
	 HwvMdwdwqWuPcxcFcaZdj0tOJFvRwc4ayL4lWWbywDzfclFfoXspcArM1Audu7VNzp
	 XXxNV/u1h46a0Qu+3u+DvXnFk8J0ezOWBvI62vSCQ7ZNjP/Jk3eiXc81eyTvi/E8Px
	 D9IgDvnRr3uvYwnqmsAlpdmXeNWRHQY+e9FmcVF6aZeiZBBsgJcDNaNregjDc0wv7t
	 LFNeNSW4HfFWh59WBDLx9qYuLUvJIpz79gFQ6JjAmp3KrvmFH+9K16UxdaE6mM/DMm
	 fcKDzIjkglSsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/16] media: v4l2-common: Fix NV15_4L4 format info
 block height
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Kocialkowski" <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260518102451.417971-6-paulk@sys-base.io>
References: <20260518102451.417971-6-paulk@sys-base.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 11:14:23 +0000
Message-Id: <20260518111423.DED13C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Other tiled formats (MT2110T, MT2110R, NV12MT, NV12MT_16X16) incor=
rectly take subsampling into account in their block_w and block_h definitio=
ns, causing chroma plane under-allocation.
- [High] Formats with bpp_div > 1 (e.g., NV15, NV20, Bayer 10P) lack block_=
w definitions, causing integer truncation in stride calculations.
--

(Note: The format of this report is altered due to recitation restrictions.
The original patch code is not quoted inline; instead, a free-form summary
of the findings is provided.)

Commit: 04995fa68d4b9c2dd80539724de182a617de7bac
Author: Paul Kocialkowski <paulk@sys-base.io>
Subject: media: v4l2-common: Fix NV15_4L4 format info block height

This commit corrects the NV15_4L4 format info by specifying it as a 4x4
format and ensuring the block size does not take subsampling into account
for luma and chroma.

You noted in the commit message that block size should not take subsampling
into account. Does this mean other tiled formats like MT2110T, MT2110R,
NV12MT, and NV12MT_16X16 are currently incorrect?

Looking at their definitions in v4l2_format_info(), they seem to divide
their chroma block dimensions by the subsampling factor. For instance,
MT2110T defines block_w as { 16, 8, 0, 0 } and block_h as { 32, 16, 0, 0 }.

Because v4l2_format_plane_stride() and v4l2_format_plane_height() apply
these alignments to the luma width and height before dividing by hdiv and
vdiv, an unaligned dimension like width 8 and height 16 would correctly
align the luma plane to 16x32. However, for the chroma plane, it would
align the luma dimensions to 8x16 before dividing by the subsampling
factors.

Could this result in the chroma plane being allocated only half of a
macroblock's required dimensions, leading to out-of-bounds memory writes
when the hardware writes full tiles?

Related to the macroblock sizing logic, do formats with bpp_div greater
than 1 need explicit block_w definitions to prevent integer truncation
during stride calculations?

Linear packed formats like NV15, NV20, SBGGR10P, and the RAW_CRU variants
pack multiple pixels into a fractional number of bytes. For example, NV15
has a bpp_div of 4. Because they currently lack a block_w definition, they
default to an alignment of 1.

If an unaligned width is passed to v4l2_format_plane_stride(), the formula
(aligned_width / hdiv) * bpp / bpp_div truncates. Using NV15 with a width
of 2 calculates a stride of (2 * 5) / 4 =3D 2 bytes. However, two 10-bit
pixels require 20 bits (2.5 bytes), so the stride rounds down.

Could this allocate less memory per line than the requested pixels require,
potentially causing buffer overflows since hardware typically writes in
multiples of bpp_div blocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518102451.4179=
71-1-paulk@sys-base.io?part=3D5
