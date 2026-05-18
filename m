Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCED36D50D;
	Mon, 18 May 2026 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119407; cv=none; b=uRVgbMa2mcrNRkOkSwFCa/gkQua+8mVBZQMjCghkLc1Ki4sH0GjQk6SnPLqm10HYDjVE5zw7qpcUm+LKKbkEGAYo7KFelkzhyI3vyqUwKsHDTsVggyvNBl3o3HajYuMgPk1vFZVvyIs5RKLz3o5NbQocltt5cO5tJsgNCnMPTd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119407; c=relaxed/simple;
	bh=m9q9QJFfEV9umMgLlraW7Fr2NdJk3fvhZlCq3TEk2pg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dfx0peqv9VYmDjBhzNhmWBhiIMFB4qJ97YbjbqzbXAJ9yvygj+ea6QvKHH43PvEIznt1muhZpIzll62iC3oWmA8yyEGuK1srFPy0j5Pvv0xcd3qdjGJvFhIyNS7pZdnCZFnBa8t1jwFPEvWwRDaXScKulsrdTBG8aH9xvS42Syw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoaJO2FB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoaJO2FB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12589C2BCB7;
	Mon, 18 May 2026 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779119406;
	bh=m9q9QJFfEV9umMgLlraW7Fr2NdJk3fvhZlCq3TEk2pg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aoaJO2FBYCW8k/jpn4xxuN93fXWqISexP0KJjgsf/Mv04GRpJ5+eBPYZHPX7NMRn+
	 e35Ch0rmMhcaELxQB+IuI8MqpzLgsaeyehk/lGu7IMA96XatfAl4qxkjqVtXwnpSfD
	 3SQpj/yZsW7I8QN8AZxIh1XJ/cau3MXMHX6799MV+kqL1dYppLLR4RKJNfLOwB96AF
	 GhFEANHu3Hbcn91JU31yO3VYbgC14qZqzMQ4w8LBcFJuG1NEkQm5sitjNLjOvMt1Jh
	 7XCkVXGyiVylkDQG+NMyVL/B/j/rFsHWKcCfauCbosQ3u6N3BWs2OCLpCsiIi502Yk
	 vRs6PFXZee2xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/9] dt-bindings: media: sun6i-a31-isp: Add optional
 interconnect properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Kocialkowski" <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518153339.619947-3-paulk@sys-base.io>
References: <20260518153339.619947-3-paulk@sys-base.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 15:50:05 +0000
Message-Id: <20260518155006.12589C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message body incorrectly refers to the 'sun6i-a31-csi=
' device instead of the 'sun6i-a31-isp' device.
--

commit 816ee95ed6c916a2cdd9b96a5a6e283ad0e7d42e
Author: Paul Kocialkowski <paulk@sys-base.io>

dt-bindings: media: sun6i-a31-isp: Add optional interconnect properties

This commit updates the allwinner,sun6i-a31-isp device tree binding by addi=
ng
optional interconnect and interconnect-names properties.

> An interconnect can be attached to the sun6i-a31-csi device, which is
> useful to attach the dma memory offset. Add related properties.

This isn't a bug, but should the commit message body refer to the
sun6i-a31-isp device instead of the sun6i-a31-csi device?=20

The patch modifies the allwinner,sun6i-a31-isp.yaml binding and the commit
title correctly indicates sun6i-a31-isp.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518153339.6199=
47-1-paulk@sys-base.io?part=3D2
