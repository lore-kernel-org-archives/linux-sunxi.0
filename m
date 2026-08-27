Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5566741CB39
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Aug 2026 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787825437; cv=none; b=fd+aZv21gSDhUoq/g7T5/eXx6zO7XhhDbZMs7Kpambs44Wr24i8uYUA+C1hs5VfWgn9B+1hAhvPZNixAVBE7I1HaF7Nxl7qxaXxz/z7J9fQ3bTUIF8CLOGfJtoqLLzysohdGYerBXzqrlnv7q7muXP189RXo8D6JCiKzJjHBjEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787825437; c=relaxed/simple;
	bh=l2VYW4aqfkfpWJPJy6czTou4ysrQ4Px2fgIJDxc4EcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d96Bcuon26L9FU8R//AVChhbFCQypWaDTw7Vg78SWRhTGHSRHBeUINaxMWGYsgDvvMfMKrdA7M4jKr3WR4Wo0zHhYgXQrFD6TWMAkBgv+MMbmgAZZI7bkYs3/wrtIqHKHVQ+MDi64BRrPvQwPgx8D9vXTlr4J4h19voxnHb1r3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuU7PSk6; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuU7PSk6"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bf94664327so1141030e0c.1
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Aug 2026 03:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787825429; x=1788430229; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l2VYW4aqfkfpWJPJy6czTou4ysrQ4Px2fgIJDxc4EcU=;
        b=PuU7PSk6wD2LxVA9VmCKi2ycAZZn8412llcFdsVNiL8id+RVchj0r/eB//8425lwlo
         Exk5z05I8e+SWK1ipna96kQgzzn/vg0awPvQ5AiGe3lwDaa0N2T5Dm3luAPCe45fb4RA
         N9bdW7hB+R3VDWVg0jywv/ipZ94XELCNdfRr+k3tibTUDlWGsUEqLdn0h/P8fzT5v4nE
         AThGrx90GOAqn/TDBkJqbn0GUNJEN+ZUjabvhhGnNzZIh1bM0voKthgqvu2sw2DCVtML
         sqjjhuhMcgfoY0tNtahjJ6zPzNbeqVsv1N0C0kLdnmOobyWGqmkiDVifOTpA1w5Jrvr1
         OuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787825429; x=1788430229;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2VYW4aqfkfpWJPJy6czTou4ysrQ4Px2fgIJDxc4EcU=;
        b=NiOqXpcVB8SPXrrsWRVBvulidsekirsPQSLQoPw9vki8tbZOTMQiuzyTjriWgRrJFJ
         0adaYhP137Yz1D4H/flYZfv77FVeIMr7Jlvmn+pjl07++IMvV2LPICeFM+FhOW6c4JYv
         yqTbTpDm2sYiGlSTyDh+e97PcjSsw/jKRINRnjaEkGcYz8q4IRfKs8SjBomz9gYMj7RF
         98Bdc351G8X3XkULVLVvS0Rcmke9fGVobjq0FOU6GCNnJWx9uTcQZIR8PSKlS7PyX1oZ
         kelE/oTwqL1w1KUR5tssFauCW1jcFr8skT+GOw6WubeCeIWB3KjWIMdXtr8b8JsTlQth
         9rLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFAff0WVDs461brrm/Cd8YsAZNlobZf4wiue9eCnfySot9PHFd9uTiHMcxP5fAQ8JTIKJo/lSEC9Matw==@lists.linux.dev
X-Gm-Message-State: AFuF++kP5w8LdjuMV+h6ut1usdN/7nx31lDKV5o54+1++jmtiO224Pie
	5d+YzU6Sm/k/j+aeC7+0uli/PVqLVh7+dZi8EPdObvx8mt8v78UWu2SN
X-Gm-Gg: AR+sD10UlR201QcFC1deDgFmb/WS9dlR/tJ+SK4LJrEci9uPD13+0m6d40+vgX914K7
	8Xfw5r7tJzCNlPy6XvKcRvDCpQVS0e9ArtKUZ5igpYqjHZAgwGq6J92IFbfmR+AVswlT8ssawHz
	EYfHrnqIBxlMbM3j9tnppvYjdQCyje9LBkFF0pyLeaooCEmg0D7MbW2Te94yESGGEMXOoSwib8z
	zux+zjp4QaijmtnK18ShBdK7piBtOiO/krAsVhgkfBngTJs4S2DHP+oWmXg1hWzArqNY0XuvTwG
	yLqyknoDgG8R1oHM9moexleVUKbZoLYQVaYB0ZoArcO8y3jnxq89wm0nW++UpfB0Wlu8b9wqP14
	drq9JphqjAN1DwVTA5a7aHW7DX9Zp6Aak/EKuKFnCS7sTvRJKT76Li4zuh6YkeNRmCVqdpzpABK
	FPVw2UTu+9uLWB9SbB7xmxd2A0RwkLn1d0ZvGkb8tRUeYfWq+6HJpdHpeYQtXgSRitMms4+KttI
	o2onE8NDOZuAybZQiXfy15Qd8DL074jrMJN02AIqBqP6h54IIrFXdWuc6aJS+5DIcpt3UE=
X-Received: by 2002:a05:6122:c91:b0:5bf:b500:c4f4 with SMTP id 71dfb90a1353d-5c65bc6afafmr4514953e0c.2.1787825428571;
        Thu, 27 Aug 2026 03:10:28 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.239.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c660014355sm3372142e0c.9.2026.08.27.03.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:10:27 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Thu, 27 Aug 2026 07:10:09 -0300
Message-ID: <20260827101010.12487-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <bb7eada0-19fe-4602-a2e7-554e914b8205@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com> <20260826230720.466026-1-vinicius.eduardo.pedrosa@gmail.com> <bb7eada0-19fe-4602-a2e7-554e914b8205@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

Thanks. "After -rc1" is exactly what I wanted to know, so I'll wait for it.

On the P.S.: I wrote it from my own notes and ran it through an AI to fix
the English, and you're right that it came out worse for it. English isn't
my first language and I leaned on the tool too much, which got you a
forty-line report of something you already knew. Point taken.

The reason I was on your series at all: I'm porting the Radxa Cubie A7Z
(A733) and building a Yocto BSP layer for it, so console comes through
pinctrl. The board isn't here yet. Once it arrives and v2 is out, I'm happy
to test on real A733 hardware and send results either way. You posted the
RFC as untested for lack of a board, and I'll have one.

Thanks,
Vinicius
