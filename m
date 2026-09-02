Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3370A3B71BB;
	Wed,  2 Sep 2026 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377740; cv=none; b=MUFXfhH5A1cPvUwKDOg+qCRtnNvQ/65232zflsQYtkUEQdRysGn60i4URorNmmj4RyXWUlLQRrgW7HB4N7EbKyoriwLQIlZQ8rWIZ7SFA/S2PkeJgPhcw80k2wD+RqvVpmjRPT2Gtw0kXFsBBmIOrtNigfYL2pdTfeh58o+s8UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377740; c=relaxed/simple;
	bh=5Hx1/YBoP1a4p/2jOdVUog5Zt6Bg+KrLm+FK4F1r0L4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NWgPhEpzhHqRPQ+bzwyTxvZO2D0uY+96dzQbujEa3L+hdKXN2VvQv7L+0paDtz0kct5ZOxLk5LQQMhc2Zk49FTCsQMHxWSlpzdlZseChIK4xj1nOCjn8c1jqj5pITOs1dmo9NuzyGM1QXeK3NKOhcbEwTKlM4nowQB3UxW7Vhio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ao3TnAiA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ao3TnAiA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809261F000E9;
	Wed,  2 Sep 2026 19:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788377726;
	bh=5Hx1/YBoP1a4p/2jOdVUog5Zt6Bg+KrLm+FK4F1r0L4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ao3TnAiA1F5F2ZgBM+3eBaE+BjLWVJdUk9xap45NTeA12rL0dyNC9HFyJgMhLMNgV
	 YzLwnu3nK0lzTDw6dl7loKYGIQ872vgIKPwr4rLooOLrSrTR1VVfYsyNwWNz0RPa45
	 QS5KFVO8QK4W6PYrnzF9vNMeW3XH+zuAMKIxpzd8DeK5JMP32ESlPDQQYjYjLXLony
	 2rpJ4olG8qX4uuxykJOjrVpffZa1ydk3xOkrbPrX69+HoMku895c3XcWMGl7brwbVK
	 9qmN3IW0nbOIClDoPq9kqktZWtkw5R/09DYNDU8bez8nx+iB/z7sdKcY6CkxNO3MBo
	 kOGtaklIgI9Rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: mfd: x-powers: Add AC200
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260902-submit-ac200-mfd-v8-1-2aa06720b8ac@gmail.com>
References: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
 <20260902-submit-ac200-mfd-v8-1-2aa06720b8ac@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 19:35:26 +0000
Message-Id: <20260902193526.809261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> The AC200 is an I2C-controlled mixed-signal companion IC containing
> audio, video, RTC and Fast Ethernet PHY functions.
>=20
> Describe the parent device and its shared input clock. The Ethernet PHY
> is represented by a PHY package on its MDIO bus, with a phandle back to
> this device for access to the package control registers, so it does not
> require an MFD child node. Function-specific supplies belong to their
> consumer bindings rather than the shared parent.
>=20
> The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
> matching the rates encoded by its documented clock selector.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-submit-ac2=
00-mfd-v8-0-2aa06720b8ac@gmail.com?part=3D1

