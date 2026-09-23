Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7CF3BE156
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162682; cv=pass; b=aAkLZOv7hv4OyJjLyQ1M1XAJmYWtfnuS0vl5Z647XqC4amkjHOXJwzN+u6L7z5yDTF57UGtEE8gZuAMNkx8vg17duH8we0cADZzCbhL2KcSLWVYEoMclNI3Jnke3W8Uov364uTYVrBxY6cxyb3gqzOxcHwITN7hA1zWwS1dtCaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162682; c=relaxed/simple;
	bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmX4B2llnTEpubstTdCCvk/UX+tyAlOBYAB70phDa2YK9g0cxXg9yFjGmuRa8k3eWp/c8uVhF6BWXl+D+Z02G+B9UGJsa4pazJ/doyc4mVOqyLZzgwgNch/IjZKoZSNb9DtebT92yvNnd2dUHZAx6OlsOSICVjEzcamLzcx3lRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6/ikzFq; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6/ikzFq"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91205165f71so5148156d6.2
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162679; cv=none;
        d=google.com; s=arc-20260327;
        b=cvAoaVckc9FzqXxBw4kzJ7ti/CAcve+xGvr1sjH1zc6/NfeuTm1leC0epSIvXINedB
         T+8CEycsnqRAVx/rApNBb3b5W7FnqobfuBWdZTnXu3KszAufOQmftzY56Jo4C9/l0+QF
         oCQfDtnjibHLWRI8NgPuq/L4QT0gthXBX8vGupPK39HA8YCvyem0vXOwTKjCZVYgKutR
         7XR/ej8UtTKjVAjXgvUJum1LZT2aQkLxVfPoxBFGveOWo2jdPqXlkt9nCi0AgtyVF1dP
         lZ22RMHQFsi69QAVZzO8IVci2cC2+7J2+ocEpNdx5DJFdgpcoN3grrBYwutT+DPAn9ua
         ux4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
        fh=1f0g/EE5hGA4dYPUwWVcOl7Jp7rBcLxMBERTt8Zsejc=;
        b=mXfYqBTlwZ2Q4TBBfWvBWQ/yRBeRhV34HHjOijKLXbcQoiAt/JtbEDonlnIKd3U1Ec
         G/5UfrqThXpYQ4juWZGkPmK/2OiW5dJ7SZCVFyIdJ/BUNcuXLHJbujdTy+J8CA27u+uj
         f+d4B2UijIymvkEuzIhRLNVvXyUxq8mFqW3l7Ql7sdxXEkn21YGaftbLT//By3heXhxB
         6M25RGHR1krUS3ez8AeD+sVx5K+FgvF9uPBC6n4g8CSViugvuj/Lu2sM11wOWIZUvLFx
         AW27kxainDf9zMSih99+lXFutvNbsLmDvtQNMycmFQ6RXp6xDJ7XZkK2a5GVObfYGnnZ
         /XWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162679; x=1790767479; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
        b=f6/ikzFqQJmV29PTdylwZAmeDge0zqiC5JRROrQWCv16nwnUEavIfiUtQLx5I4UY2Z
         fn4LjPXyQvjNMKqSdQEU8v5Ts9Q/aAehdS40usZPNzRoCGbAYY+0WeJsB53Xs2s1wqB0
         +qY7ja9YLBr1S3Yctue1t/f8HzKg+YmWFYP+ldzyjm2hObUnULmCkQaEgUKiYOgdq+yS
         JwCLsrVksmL4de3YmB8VLWRuC2uK9ir7ktw4kQW7f82HtT6v1k8n7dyCwHAYRiJacq4G
         irJtdIz//2vwVXXnDT54IObPClgvwi2x2MncxO5WwAiFwc1GUh89loen6wEogau1Abkl
         tTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162679; x=1790767479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
        b=qyFrNOLa/Vg5sRiQpcxHtf2RW37zffn6WwVkbMi76obWDYlKfmOqaZtC0ndhCnhmHf
         eoX7RHhKaVTT4IyEnDhdBzD7iR4NWY1xy7ACckEUuZ12HUAK92SGMvESN83F0i9B4bzS
         fYbz0VMAlbBHd8PAoxdaaa4pAjn5LsQP+4WDnxx8DptxYZgPS5/r5XZ/OQP9aCED71g6
         E3rlqTu4a/dh6gBfvU3+sQprNlmfXyZ2ZREshejXhxHHkqLC3wQZtWaHT+OzFfdtcefP
         adp38rCSxUjM+HQevPcdY+DI2FUgf1H7ihWWOFJfJ1P0tB8GZnwY3AuZ0bJ2H0PgqeMg
         BPYA==
X-Forwarded-Encrypted: i=1; AKwUvBxtP0SNhLpKXCuhKN10ofMAQBzAuMBV0xQJQUtfqXi4CsAmt9NYayjHfHhSwu7K0QoWR8aBDv5iPg2qvA==@lists.linux.dev
X-Gm-Message-State: AFuF++kwyOqSpUtu3IjO61KhMAzOIE5G/x+bYfPIxeMfBGau3L33YjOM
	zi0eXGvrBPC2QPzE5fwpfnxfoQ3ViXmlRg0o7EaPvKrTMs7GlvJQpFbl0YmbCjpJgtLbreQLdqp
	rS/shJEhdnQFumkT+wNonhMquAJ6oVYk=
X-Gm-Gg: AYBFou0GMpMCr/ddO6IZiXKlibgu6ThTw7bY4P2aOVjKxEuLllbubUGVblmz1Gsg+FI
	+tozS7+3lBZ8kkKdtwLEgCRwOXbgvdaE5mD7OlVjSetxWhINbIEmhYb7XNrLiEKHHbVAvwO0tDy
	G9PJ0PgFlykaJG3v98dfbWcGYx/KmQjiJ2l3z2bYCIEREGABAtQNTxjBzy92kJ8BAlBoOyz6FgQ
	ChM5UnOjWIWOYLGRP851oCod6a61LMoAP+xa0niXUggVWpZUXKBqJZko+Xlrr+rw8QSYD1lLZms
	L5olERHxrCSDvI8hzLuLFPoufgAqdszlFp05iEIoXcQQFsAtSDyXbtffyA==
X-Received: by 2002:a05:6214:2507:b0:914:44c:6346 with SMTP id
 6a1803df08f44-9140c3c38e7mr38390736d6.34.1790162679333; Wed, 23 Sep 2026
 04:24:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105208.198-1-anykey196@gmail.com> <20260923105920.CAC761F000FF@smtp.kernel.org>
In-Reply-To: <20260923105920.CAC761F000FF@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:24:27 +0500
X-Gm-Features: AclHuK9sh5FBNarHLAEfVcm3oesc7H4_pIzHCxSA_Op301MlJ4p7eXIkEI6zvb8
Message-ID: <CANHPwARnF75UhVpW2UisXW3QVyPiyMqEnu=MGFkQSVUh2F32GQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin
 expansion buttons and IR
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thanks for the review - you are right. The two buttons and the IR
receiver are on the optional 24-pin expansion board. With the board
detached the LRADC input and the IR receiver pin are undriven and
float, which can lead to phantom key presses and interrupt storms.

v2 drops them from the base board .dts and provides them as a
devicetree overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a
Makefile entry, following the existing
sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.
