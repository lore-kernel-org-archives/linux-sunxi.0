Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2736636F916
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338380; cv=none; b=VJmzFyZP2RjDPW0K8uQ5iDhYJGVIguUO2L8TC1Y+rA/GSeZlZTOUEchAgnJ58haEBTSx5i8bxLFGoyDGfj9ytjlUks0iGmOn7cIanuxIjUxfebU3DqRq/v1+Eye7GMKUsDMWu0Yg+WqUvoZjrXLPEOTxP7gzagoVZmT4io9hc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338380; c=relaxed/simple;
	bh=x+DHXyBduh8nW5mH/RwXPnUoFvsJilmF8kF51mFs5s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WcsSKb7u52JIJr7Sc+t/bvJVj+rtDSA3+OyKtsjJ9xVhVk7mTxnNuej7Yvh6PoeyIdPq+2thMPv6vPpCgSl2ysw103hvizpzZV0YgMLEKjdVcFstV9vg3ourPxBBpZFFdJR9az6DTLHJPf5uMlbbqxtfPFRpbefae2RhJK1TI1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Djir7w6l; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Djir7w6l"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b64c8311so18071595e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 01:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338376; x=1781943176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+DHXyBduh8nW5mH/RwXPnUoFvsJilmF8kF51mFs5s0=;
        b=Djir7w6lgqhwhyqcZix1H726ugSjdQspFq0+JJk7IxCOgJvdzdLmq7JUw5DOhu7Mg6
         nz/T+BFcSbeXihJD7i4CWXjLzP+kf0Jq4bGsCXKqVjBgeSgSqBV/0oLw9glmChJW5tYV
         JeuqJNtvSZToR8PscoPDpaO3aGgp1htAmNIp82IC5X1kXQWRq6b2q1QW3nskD+tzH8YL
         MV90A2dZWWPRxMnP5Ly2S5mbVTxUdZ3pg/jXws801FF8XjqxhbDy7AWkiB8cuHsJOw1Q
         Ze7MCOSLqbueBAKtycI8MaHCccfC6VopyRpSWSaak+s1Zw6UulXvDioLp09J5boxjqWD
         AKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338376; x=1781943176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+DHXyBduh8nW5mH/RwXPnUoFvsJilmF8kF51mFs5s0=;
        b=jI49jZY9rZve4pXNIuEUFNlVuKZHtCOjZF5FunfbqyJ64qG5RuLqelf/odlkz6WrUG
         MINQUjZHlWTgzPPCyHEhXeIfFYYgAVVyawktfmF5UgyvNYAsjQnIRQak0OCOBdZ8eIcj
         C0H8rT9utszSKCHgckDuKSltknxygOm4BJ9aRa+g27d9nRqiAqV2prVvZXp9gRqRfmgp
         K89BAt+kB6GC3Z/DZO7+jmkPyR07DCFKbLbpex+wONA4hlxDucDbORiV/8Wsh3TgPaxL
         vwEzY69iNc7FAQtjnAXtOv6Nfi9SOlAHIKhTeISvjcKdqa3Zs5CaP3hGGr7gl4oyc8T1
         WtJg==
X-Forwarded-Encrypted: i=1; AFNElJ/asuds14baT8DplD9qt1GUU81Ho3swypvY63H9snLG+905xB7DBfnb/J/Fb4abpaSgPCb6jdKri+56mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRIMq4qUvFdwXBJlGUfhTjt9+sjms2o8tBJebYFEqMAM0fSm7C
	SNOs49QAsqD0sxgq4EvVI7uU232TJtryVtwq30jGqgLbIYL8IaarSQ4l
X-Gm-Gg: Acq92OEVSigVMPeMJXrRSxr6JDADc0kfiKWscCaRVR6GWbnQIMo9nKqeSXlzOzBOJ1+
	tX7jSwshPKYC4vSiUWeYDKgz+XMFzQiH88DMAF86xGQHkk3qaisCTzufrxn5Jiy3Afy2BxOHhHM
	UEigHXdyC7foOLBs9aNifJdtpRUBgoGGyyfwNMGjMQUP6EyWIOSIsTtZZJ9a4l+AxGpoFkNlPm9
	Yn0Scq6IQm8SmwWQ/kJcHPdmmrVDz+BIt5Tna/UtGRuCdfX85RgH3xX7eMLo+LfC4i6+MeJyG1/
	99B0u0Z92rtyApZ2QYo0v3NYCGBxNLtbOA1fyO9xe4vigrngjX6grvpgTSbl4M9+avRqF8SJq8w
	4MLTq59qQaouJQmEL5ZJ46g5I7qRLxzfC03BLJ7YwU5C19bq/yNPjaCjN6/ZhC5I6/hTZLoF8Hn
	JE7uaANyMWpyDV1w8kQmvtN1Uoth8jomnYLmqeXLHIuO4h
X-Received: by 2002:a05:600c:8b31:b0:490:e5c1:b8c6 with SMTP id 5b1f17b1804b1-490ec4b58ffmr75929755e9.8.1781338376446;
        Sat, 13 Jun 2026 01:12:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4b39e9sm88333215e9.0.2026.06.13.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:12:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject:
 Re: [PATCH v4 1/7] arm64: defconfig: Enable Allwinner LRADC input driver
Date: Sat, 13 Jun 2026 10:12:54 +0200
Message-ID: <sIT7xrHETBux3nDrv9ggVw@gmail.com>
In-Reply-To: <20260605070923.3045073-2-alexander.sverdlin@gmail.com>
References:
 <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <20260605070923.3045073-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 5. junij 2026 ob 09:09:15 Srednjeevropski poletni =C4=8Das je Al=
exander Sverdlin napisal(a):
> Enable Allwinner LRADC input driver as module to support buttons on Baijie
> HelperBoard A133.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec


