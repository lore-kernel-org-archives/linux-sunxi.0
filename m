Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3962144DD
	for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 22:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748386064; cv=none; b=AD90Wgl0Xm7xfZHWHqshHSMA7gD67BFm+16VcRzPxVuvXKgbaoCr8ULmpCvxYbiSXbsPtwKds4fRRPzmOJymDLM+6WVyTNbjI3cOZJbT4mZClAGj7oMSYZNVfwwQT+jR7iY1mZbjM6NK/yFT8NY9GOjadiV4wq3DMDF0qxx0jvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748386064; c=relaxed/simple;
	bh=nxxTE8N1NiBs4G5g2I9AK/16Q2IKP+a3RuAqB4TehIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlgjO7CVceWVWmHyIt9gtdY9HenllYG/lFiaCu2P79zR7TTtNXPvJSe5Tlb53CmtFNe1KAF58CRsCwha1gvL2XvtX17HMfuXhE+Vuzj3oF5GekU9iYxmYe3z7SuYdbH1bvVFI8iA+yw/ZULbHTyV+inDKWzjTkAucbZdCld8DIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPOxqT8Y; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPOxqT8Y"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52e728960c3so1490918e0c.2
        for <linux-sunxi@lists.linux.dev>; Tue, 27 May 2025 15:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748386061; x=1748990861; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxxTE8N1NiBs4G5g2I9AK/16Q2IKP+a3RuAqB4TehIU=;
        b=UPOxqT8YyagYTH2wK8n4SG5iu755PkUdbqEt6LK7UkdKJYXpG5wJBX1I7Br8kfCOpm
         +CAPNw8zdyb3c01beNB7yipTFVIIgm7juCdBUmyeNTrgKqQimBR82GgQ4D17m0rOxklz
         gS59o3MN5+KtAaVZ5r+EFmLnekHTffbDJ5nyKqLULMZML53NIGwF2z5UBkueulJenYmV
         0t4nAYTiTQI3VeQdjP2nchY+n0GUT5Vbhjma0RE8GzQLSMyaFoLSyca/tG2c6GxATd0Y
         8tup9AKjW6fjW+9VNqsnTfyzHRidMvULweSVHquQ/ulhCX3EDSv4TOQskGy72rfXu1S0
         DSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748386061; x=1748990861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxxTE8N1NiBs4G5g2I9AK/16Q2IKP+a3RuAqB4TehIU=;
        b=mq6bjQVp13TNLX3Amji/Geu7W6wwyDSRh4kgcCAT/TAfx3wLS9TvA9McxpwosgH4kB
         Y9DDkqvt+CWjwQNFe9ntVzoBRclebgNa+mJqhwyfvHLea6eoMjL7zIMTB1CJsSk/jVYN
         +C/svvq7RrI9yqCQiZhr8XnplN49pqxjoJVE6lnVE6lR7fLVpiE5aiHTXkFn2uHQvCCw
         rb5Y5FtfLalgG2bF0FNLULnKWCy9c4QNZmPw8e1S8rCbncz27WI3qrrKcJXcBLyh3v+K
         plmcx36qavS0HdruvOYit/REdDx3ATWC3xinaznUaI+LEpjIzH2btDsGhIL69anVWgJ4
         nkSw==
X-Forwarded-Encrypted: i=1; AJvYcCV80gBOdJPaa4Ung63d+QTZ94tufcJ7YJJVskecx/589zXXFJMr4Z78XLGFlrpv+ctenS+0XfE5O7Sh3g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2t6zdvptxRNpWEGad8ovy0/vgZNDYdP2fR7pOIliEcMoOhzui
	65mKz60fPmxnmkHqk7o4W5aek9zQe0St7dJ9Jx/rZNTibq7qspuevyYcTLo+Ex/1jyletE3Y5ih
	1frrAXnslTBncos4SVwIXQ6meiRfb97g=
X-Gm-Gg: ASbGncs6/CD3UTksv5QQHDu+PSmQCTHSdhGf8Jh4tRe4/OBdFJg683EB5ub1tTjVlaM
	H6cZqUfNx8Qg2C0l+VJulA6/ThSF8+Cz4ABcIQILBCUiOsmdUv7IhGFZGpo05ZNfi+JYkuD8reW
	uhcK2uF7/H6sOBsnV5JhGlx5B01LWXBnJD+A==
X-Google-Smtp-Source: AGHT+IEIHMkdlH/en+uXp0oVsAoqX5M/MWpWjcwQtNcI4RUU/vNIUEP2JP+Exp7QavSYY/Cs2DChtfMhjj8/xUWGVBU=
X-Received: by 2002:a05:6122:3087:b0:530:63d9:115a with SMTP id
 71dfb90a1353d-53063d913a6mr831217e0c.4.1748386061291; Tue, 27 May 2025
 15:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch> <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <93bfec74-c679-400f-8ce4-3bc84d6d803f@lunn.ch>
In-Reply-To: <93bfec74-c679-400f-8ce4-3bc84d6d803f@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 16:47:30 -0600
X-Gm-Features: AX0GCFtPGtsaGbTe2C2G-Irv_0PosK6COEhRkyls49G6hbvQpWVi2Nid9Q5gamo
Message-ID: <CADvTj4oF4UOnDUvVUtuaM6U5RR4WF02qmheqg8fEafev2En3eQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 3:48=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> > On Tue, May 27, 2025 at 2:30=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > Sure, that may make sense to do as well, but I still don't see
> > > > how that impacts the need to runtime select the PHY which
> > > > is configured for the correct MFD.
> > >
> > > If you know what variant you have, you only include the one PHY you
> > > actually have, and phy-handle points to it, just as normal. No runtim=
e
> > > selection.
> >
> > Oh, so here's the issue, we have both PHY variants, older hardware
> > generally has AC200 PHY's while newer ships AC300 PHY's, but
> > when I surveyed our deployed hardware using these boards many
> > systems of similar age would randomly mix AC200 and AC300 PHY's.
>
> Are they pin compatible?

From my understanding they are entirely pin compatible.

> But i assume none of these boards .dts files are actually in mainline?
> So they need to go through review, and are likely to be horribly
> broken and need fixing? So you can fix up the PHY node as part of the
> cleanup.

The specific board I'm working with is not in mainline, however there
are boards in mainline that will have the exact same issue. They simply
do not currently have any hardline ethernet support in mainline at the
moment and have to rely on wifi for internet connectivity unless using
out of tree patches.
