Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7433C2DCC08
	for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778444212; cv=none; b=m7FWgx9F2AqyWCuX03xN8GYryqiVQlpKtFhZuKbylf4PGk+yFjjhOsuoBILXnLgudbSC5yZgPpMKRHGUZsE+Qy351fQISlsIeycIaWDXJoNkYR+qzZVFkZ+8TlkF/mnOObjdunfZiZ65cZyI58ve/AzIjBIdHnyN/ccgQrypf3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778444212; c=relaxed/simple;
	bh=OWCEmsRz0qAl88C6oETHRWXimfKd+7tWIWARlti8lDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dhBAnl5h4WQuQJE7LDa1gWP9mqLkbdVSmJvZgxhimPJEoEQkVOGdwOuYyWiM6lNsuFM0thYXNo7zgg5aXtuSnd9fBDdrbV4bt1mPnhwPznbWQ7nNCyybnYEUVPuGVkPf8Ba/QELNIZsindcMi62FEqEsjnT9OY/dD0DRrRmla8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQSUGL8e; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQSUGL8e"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so39477905e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 13:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778444210; x=1779049010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=DQSUGL8eANQtYJz7AphnmEFT4Eujuw4TewCXnEfb6O6eaN2vgnnLOrnxOLBk7yr7U/
         RY2MZqmTuiulvS1Hed74Qk/kCPTPiQMOyal3zk3BjUQV8IqIvf4cbOLii0GYzvqiK6dl
         jm5jd579ruHeELOWuPz2JJzeJBBe+hpfG9KDUjM4LlKA0sqCjh8O6aPI++QKgckq4Jze
         NnoU+j7KfbAwUZ46astrjG4jMx1p96TAOJ0dcH1PbdaA+ER7SYjuqgTk+9AC6VqgM9Jo
         418xSP7gkbg5UoIalBgG2fn7UDZHWobCRKMxhmrtQz1+PVQbSH0cw+z/BvhfSEAm0rpP
         ZH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778444210; x=1779049010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=h9oSjLgz2yz3xf0OUP+bpp4i0LCLKraFSf7QWByseoHjTQOoFeewIElGxIzB3nJG6N
         vXZ3FnsM5awILgFSKBF23rTqmoVSWP2wXKveu7ea7lbC00iwVPtSPaEvlZgyYSGXC/BQ
         +bU5Uc6BW31rMphG/tAaJLfkyET+SzRhnPRnMAUmQ4M8woojfHG1+sAFEBKQRL7hHETf
         8Rx2tEN6tPPCbWGiE/T7VUMyx3z40bsBrATxj8KEVL/a/cdiasKkGuKRj17VqQ0kpI+x
         AUw57Hsy0KUPogQ9ZL8eg0v8SlMUOTARZ4WiRLZp+PTNL/umxHh79ecvQqtunttxzmd2
         6qYA==
X-Gm-Message-State: AOJu0Yzgi2x3CxSYcQJeU0CyEPRn4FVHhfVVpKJm0RHpoF7Knh5p2SJf
	TFZb+UGEYL1CcwVwuA1A0j32DGc3my48SHgdEgqdO1P3S8kdxmPKlu2JlNUrJo5Z
X-Gm-Gg: Acq92OFHzn4Eaeu1aNnQxgod0KQXNfORzYA8Wam10BXvs1Fx251VuEfVQ1euuIpvKpW
	3DfGsFWqp5p8tCEUJUvvdraZd+MxeKsrI0CX0QrWZf5/n/brcFCKyBKqK1776ksUUJGz1oMkfBk
	6/fK86Qk4xy9A/pDG/Ykiqc+RNEK/dJvYO30kxrqtxWozF0ePZ3/DJq1C0ofzxCDbgSDqVZCj82
	B4R3v/RzhO+TQnqdT4T3yRFgkhk1DKiAcGO5ezeArIp8Z+ofBTSFLxJnvsqesAqfQ05QpQe82/A
	R5yT5aNt89zriXWlncRitZKRZl8bnsWZKqt7uuWNmgjO5KONuawj5Z8DH8pz3WorR9qLExW9esi
	YpP6yw0fBONpkqeEpd8u2yFO9v55vwg3u+oJGkXOINL0Gs0BvrY6jkL81b+4KUjzpEo1lr8G35n
	rUYGPWTq7OjXx1we+qNZ+6aaR94unMcJOeBSnUlLmP0yAC8o35JAsI
X-Received: by 2002:a05:600c:1c26:b0:488:9439:880d with SMTP id 5b1f17b1804b1-48e51f5c282mr362332415e9.29.1778444209945;
        Sun, 10 May 2026 13:16:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a8f1sm127667145e9.11.2026.05.10.13.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 13:16:49 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Sun, 10 May 2026 22:16:38 +0200
Message-ID: <20260510201644.4143710-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..095cf654787f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.54.0

