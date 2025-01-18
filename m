Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6767346D
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 07:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737185091; cv=none; b=Mqe7uXY8q9YoI7S7xpJziUa1t2BuFZKaxB2SQs6pOSvQqbGAkKBrp/1BU5foWIUz5pbVv1Btn5mHZyZuPlTS3pJ/bljBqCTiLPY67odnBYHdJBQzaiio6uSKV70c2UNsFhS4ANPDWohmuFCQ42jv2ZgCKP4ia/PkL6rq3byixsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737185091; c=relaxed/simple;
	bh=yVdVorWj9H6HGRaK6ZkoKObx3RzmR6QxrZImko9v4OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oJd7wQwNJxe4P9we2atiIBtQXV8thk9HHNBx4Wp01adU178iE17+QoJdyF6Z/8qHjn6HYlE345UMRGq7dqIaB6651UR3IB6wIeVxE1KbgXcRceaI/04TW6A8kG1KD3wtU5jSt3w3LD5FzTyIjzoNflXHnGvrW+ahcf9SBfw/QX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmYeeWaB; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmYeeWaB"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaf60d85238so469769666b.0
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jan 2025 23:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737185088; x=1737789888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVdVorWj9H6HGRaK6ZkoKObx3RzmR6QxrZImko9v4OM=;
        b=CmYeeWaBkSEvES/ailn0cEKBEzz6lGX9+2FTb4Jy9M0sH5hcdvmcRllrNUYhOgkpQN
         EDLBfki06bSkktqUJ6a/C0iK6duxkpyaWByCd+1dqaNV99OeSVVS7rMvDUZ2RzWh2Md/
         gXb1w+4ububsnSW1swmug+EJ2Ll5Fa4MjC9J8D/eIhAt9gZqkaXi5iXhHi7dmOJjAnWl
         pEu5whsqDqtHP4PQ7D1YCNkwmhlqYfjWGyrxromCBzgvYaLKzJDn7qCddFmxCXikR2pf
         SLhJMU6smnbBO/oaff1oWnwqb4ZO9/5T3IVxr7NSxKuFIS+QyDi0kHZkIn+xtogrslkC
         cHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737185088; x=1737789888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVdVorWj9H6HGRaK6ZkoKObx3RzmR6QxrZImko9v4OM=;
        b=HOp7uk1qa0fF7ro1wi7MhVX5QyQtGQmaggdXvXUQc6oF291Ms8xs2dEgt/aKP8QIty
         RoibVdHoQKwDOu2en/jZXQ5hY/gE5NQuyTVG6m+aSW+uXmhY03BtrjEwM4vQkdP8CcQN
         Xd1cW/YkMZ6VWRl3NRCxHJBdwvIbCxt8uM5IQnhM6JBvUVNXqpi/0KPFwhD1zcH4AuUj
         6uk+4tAhn38ePgEkGWNc21hZ7iE/ltShbyyWOB9eOzYgGSaM4IUk+gVnw46H5Lb3Vig8
         JTWa7w+BKO8C/UieA6A3sA9EuvZfB5+sgCZHH1c9koLmCQ8/PAZZYfeT9uI1OJ/M2B4G
         AECQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoXAaVMEfTcoevC7TdXNVRNW+CfdhPUj0SOTsmf1fVis4/0I7VrS5QyB3uNANvsxyf6O/pLtqEsQlLrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbutBZFAzi60je5lYY6hsUl1fIJlGKzjccskZHcYr0O+t7PZ5G
	ivA/i+pbDSBhD/S5VNDcREuZkgL5T5S38pFTSxP7b8LeenTSKeLo
X-Gm-Gg: ASbGncv0ZnvTd66dEbH/g8dv5MQ6nRjSbDTdC2MPeUymxgz2xmKi9hR4ZIZXxWLNtFk
	plXCCalmMqE3cKyXRFkU1XOOLr71MttWac5HvVJ6YRo1UeMEDUafvtFB6CXNKnaqWIosoziLiSR
	gsfuvzrG9k18FsfUoqoWA2HkP0p6k1EU9tH5gCzUlebfpftRI13j2Pw/X8xHvPgl7SixUIAt02l
	Pd5lTAC00kXpp1euK43FYWczZV0neToVUB7ytwR3uELluzTpst8ZzWiSQlGgg/iebSSrqQJSWgQ
	TfOvgp46U0pxSbsFjEXCw0QM8g==
X-Google-Smtp-Source: AGHT+IFpPnqFyx/4M+K1AZhcJHn1T4ySfJj7G7jnLutj/9lNVkQowgcINV1aHBuTFJnWSb4aTkEenA==
X-Received: by 2002:a17:907:2d88:b0:ab2:c2f1:4578 with SMTP id a640c23a62f3a-ab38b190e7fmr493934266b.4.1737185087745;
        Fri, 17 Jan 2025 23:24:47 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f4052bsm293366766b.95.2025.01.17.23.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 23:24:47 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 Simon Glass <sjg@chromium.org>, linux-sunxi@lists.linux.dev,
 Parthiban <parthiban@linumiz.com>
Subject: Re: [PATCH 4/8] clk: sunxi: Add support for the A100/A133 CCU
Date: Sat, 18 Jan 2025 08:24:46 +0100
Message-ID: <13680233.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20250117014537.22513-5-andre.przywara@arm.com>
References:
 <20250117014537.22513-1-andre.przywara@arm.com>
 <20250117014537.22513-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 17. januar 2025 ob 02:45:33 Srednjeevropski standardni =C4=8Das =
je Andre Przywara napisal(a):
> The Allwinner A100 SoC has been around for a while, and has now seemingly
> been replaced with its close sibling A133.
>=20
> Add support for the CCU, as far as used by U-Boot proper. Linux has some
> basic (clock and pinctrl) support for a while, so we can already use the
> existing binding headers.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


