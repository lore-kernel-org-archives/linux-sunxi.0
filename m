Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503D328751A
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983214; cv=none; b=NbmUdB5q4Ua0mNQxfeT/fa1vtsjAvJos6kLT9wdtjW/o8XhyG9wXyYDGVozVPSpZ39Ezt3pbwNDy3Y1ouLmyF5oEU8Jh95z0MovLdi1ungTs0r8quYx6fySZ3++Iu6JRD4qGalCV8G/vgnLdEF4M9qy4VIwx8MY7M+RwKdSF1lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983214; c=relaxed/simple;
	bh=l0zP/IswWls5tUEjRW4gHHMAJEe54gk5KhQpTRSbZKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i3zT6KujqLC+xGCJnB8lhYIeReHgLkN/+VtSd3p2xB1GWeae4y5t0nkwerit1jSQkVUB21fUxJ41G2PwoW584GkIbNtUdPKjYAyEXMDgJcmPB9HsESOj1f0aW2yEkg5xFr2/yNKeW0ywUEqJVivtOe1vZUVbsGRQWUC7jF52AFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvw0evu0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvw0evu0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710022571cso39574595e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 11:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983211; x=1761588011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0zP/IswWls5tUEjRW4gHHMAJEe54gk5KhQpTRSbZKo=;
        b=lvw0evu0Hz9Sc/+dqv9oGKfgaNuY0uiVxBg2fCNh4ZDtDn9l3yEbLzqi7VkcK2Uy8n
         3ITzsoxfxasmAjGE5m6e7wIBVbhkpN4q+HXIN42/YwRZG0bwP+WA/uHDqMp52uoYcn8c
         pssLN9MVDSCqeEW5XzfavN7Hh26bo3adOQIpn8LzggO/a8G54g9gi9CtG4O/Vq6fpt9v
         JjEkmGibXfHCDnry5YN/3pThK3GvtzprB2F46mfz+baAIbG5hforQg4CkbJJIblmTwfd
         iWzvhpWmeR57AmlpL5iVpa+0WsMqa9Qv0AUn7PQPcQd6d8wDW3VLOoHvdc7DQOSLk190
         wC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983211; x=1761588011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0zP/IswWls5tUEjRW4gHHMAJEe54gk5KhQpTRSbZKo=;
        b=gbQ7hOtSVbc32xDnWI7FA01/u6wIZkD8hSbO2oe9L8wM7Xns/3gGVF2GJwR3OT5i56
         fSo+hdo0v3chlXBUf+wHhhoJ4cO/qKEVbgay+rz4qOAh/FX3TJSwhLasM8moIHVWDLhQ
         pPJyk8SS11JGDM63fj/oqIVjSy6Nzznj97VOYKClwVsIAWNB3CfZOi/Serl0q48nNVAs
         xBrxezrTWJLLPKf73QCQg8GRBgeLurfJhScRjEzTHz6nXhlx+AH/PcHBegWrHH497Z5q
         C44Oqr5qJVmZcsH47elVnmCONhMAfzxsU4NQqETotBJNy1J2pRoSfzdrnNKegfGNSpEj
         8atg==
X-Gm-Message-State: AOJu0YyWn2j1qYKMn+37gCBUBGB86n/Mr+JVhDSTdBhcwJTSiEb1lg+y
	kNpq9XoJqmZImDRnhOd73d3lmP623NeKMUR/Y9ApGuF20eZc7mjWKQZG
X-Gm-Gg: ASbGncvlw7Qgpwp3iOt52qO7qcFUJcvaweZ9QwKTb2jIxfwzVOy2NEPT711h0mfKakV
	v2jjAaY/8Q+laxKu5wBf7U+T12T9QQPZKNcWLv1qJ5jds7vrD9hXc66aZ7ODp7a/h+x7p7ve/2T
	iXn+Sh9Fn+vE2fjEmThGaSeKLYaAjLgaotkrlsM2VQ2UVnpCmvJ5pB9gkPjTFOqofU41+5gK9FI
	ZVpYbhExbYGTY7YiAVexlLIiu24wWLnsUmswoFZYycDx07jrhk/B2hTA9Nxn98tyWez2GJp23Rv
	2uTomaxyXlKZwy8LkFMLCK8tEJRJGK2xZ64vxq77TsQh6bVcqKXPR7Z0C5nDZSJ/h6dVMn6g52t
	h49VsF/gif0wttnJT6udob0CcXXXOecHgJ1pQ/bGunbUlIIkddNZuMjZftBvfdC77XszPKv+DSk
	rS8kT3oPJ7tLx0jMrAZ6cOpUJhXbtEIsHavUoAzs9ZpwKjVz4bXAE+nvrZgSBSvIRf15Y=
X-Google-Smtp-Source: AGHT+IGVeYcgA+CwUr1r7hUy/8iCaT15cDHaEmoGMtDm9YvbEjOd+dz5rkW55YdwDONL4X5PTcG3yg==
X-Received: by 2002:a05:600c:3b8d:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-47117917572mr126637915e9.32.1760983210516;
        Mon, 20 Oct 2025 11:00:10 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144238easm248496085e9.4.2025.10.20.11.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:00:10 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 10/11] arm64: dts: allwinner: a523: Add I2S2 pins on PI pin group
Date: Mon, 20 Oct 2025 20:00:08 +0200
Message-ID: <9520278.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20251020171059.2786070-11-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-11-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:56 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The Radxa Cubie A5E exposes I2S2 through the PI pin group on the 40-pin
> GPIO header.
>=20
> Add a pinmux setting for it so potential users can directly reference
> it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


