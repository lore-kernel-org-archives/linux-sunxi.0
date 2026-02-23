Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC43C1EDA2C
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853865; cv=none; b=nf+F+MP00T3AHjSz22wuBbxZKH7YER0kKOMx+mcxK7Xr+BMLlrq6I1zTRbDhzY7tTXN+8s0zoRdRgKcdfvlLK4Lw5lR7I5hpSuD3EIbNWBv7mOecRxB2ow6JyFKxOe66dqFtCZWFBAFANgW56kWi+8Et0xujgK88si3eCVLAbbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853865; c=relaxed/simple;
	bh=8U1qrV9VPbA1NurePpOKrOc1y8Pp0LEFx1aO9DiJBzo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NZQEmt5Vb2DCIWSFPAu12V1iTGsn87YcsGbdpD1jTSf7rIEtDUAjbUz7VvEIsUME+Zf3iSMlOM1qv79r54ZeiYt0sgi1kuH+9Rh+3Z+71vQpQohIGbjdSV3h7j1evYZEmlk7Rx4QIAVH/Y0yF2zylm7M5FnNUXXmPpruKMUhwyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcS2jH80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wcu3ojdC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcS2jH80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wcu3ojdC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYmSI322482
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BPmaMMJCKmfQnceiVQlewf
	F4pWyv++KTwwJINk8vYA0=; b=CcS2jH802qsIIJYTQKLEhIrwqr8D1QKbHK9M+T
	NxhhRoqiHcBMxthLUjI2gG+s3u02zEmYYEw3hPWu84AmQv5LKwdjUeO/aQJDNnRt
	1gU3quLKiTnBAl2CbmFg2N1RLGIrJe/y67bseKH0HTHwN4Tkv+Ya9LJ7H3FBu3zG
	jLwxa1mg94Y2zSYcrRiSqUDAytbyJ2rGyQVqCwM70nXfNjdve/RleIsMiOdlIlEa
	eiyzDSo6PlI2/v/6IyLnlj3ysVpPWy2JBNaSZ8lJILOyi554R6ZU393ewSo8AwAw
	AQIB8AowMsjr2ht1polxdbIYWQvs1Rlqi3ufx8cnu6Ek5Zgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0fas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:37:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a129cd2so5688048385a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853862; x=1772458662; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPmaMMJCKmfQnceiVQlewfF4pWyv++KTwwJINk8vYA0=;
        b=Wcu3ojdCOyUrooZKhZKjUOzK1qMxqDlFGcp8q6cIur69hKrh8H01Q/I0Z+gfw0np6C
         MshVkBF2xzhA4IlPRFN8jWie1O7iJAX/uAwOmOpvQcJb0mdtbn30ScF6H0HwWpxvohPZ
         VOEu+1ucMjMXBzgIAnEi4SpESKFXAJEWHWSxuDgw+wrVnhpxzX2+tBMddj8zHAk7nPd5
         XzKYBVo+Emzt3psudQJFTOvhi6hz1+usxAFY0Hl0AVLoeC3yN31++eA541ppxGADLeX2
         tThn+xRG/EXi0y0QvyuRIEeYH+0vLkVaQp47W7KqZyV/wzsGzrk9rAy+oESSbDcvk/Lw
         Srnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853862; x=1772458662;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPmaMMJCKmfQnceiVQlewfF4pWyv++KTwwJINk8vYA0=;
        b=HZa4kHngz5Z9Pjz/1Gglz2i2NZrtamFz6UY85vElh9vNvOGqMBrfJS6fLyggellCy3
         Qiqj06ZqGvTDfqueyHLKBipu2qYvgVyCQevSdrUPMA5XUx89tz6DWnQl9DuhzXUUNlYV
         VN7Yg5mNEWD3pJV8wuRkcrXvKbPILG/Xy9Sy2f0Pn4yr0eWa4V7ZJzEPsVfAYxQMbdpb
         R8ZqnXZgpoeYqy0SSYpTXyUZLAqBnnIJLXmf/GUHdXz4hM4V+/ANMvWdP9qe07h/X0jV
         EBawTx3bOEUdPkI6AR3P62+h9ZOFdLbi9nGYYaAUImg9l+S18Avg6NaIm7s199DM32DI
         TCqw==
X-Forwarded-Encrypted: i=1; AJvYcCWRPjbdiQu0FsCAtPpsu+H0xun4upNoufhVhXl0VAuzSzIiW/+wJm+S15Pl/p71A+GG5vk+zzBhssMZLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YylPGE7OhbWATEoV2EBw8GsoDqB0YDVeJDK4cA0cUbkirgh1iFA
	wMMnM/92TpRuTzMAnwxPlUnT/XEaego4n8vq9RRYkisV9aowh/EMbxRMrONCI32hV4egDbZyjsc
	sfBqVa8xbnqx4zFUikzLYVjGDGCWXu3NyDyRjqEz/Ojlee2Z5NpJgup37FbCGoH/v1MVytUKB7Q
	==
X-Gm-Gg: AZuq6aLVqxVx8+D2RQr/YrvWSKCEcJNTtpY26sRFYt58AIrFxWy8jIMrWZtWm+NLRzh
	ni3yo4LNUXCqWKhFY8BBJj2NHolciGoRR1lhHAXXEXm8xrLaTLC5vm1j4AGEPam0jWX6DjaFqDJ
	5qc67tEXrisUYS9QB442fw/KgOZWn2/3+X09bl8EDtqKqNTrOcdR/AQONuEoK0chVJ6oPr0Xf9d
	Ce/yOs0EWQOPb3j5cSeIF2acqhZQiW5KF6Y2pd0CcumEEPkiIlnSchUvmBCbx+QttoZbLJ9Znzj
	PJLnsv3hl0I911Xx+rrIzoxK63t8Fdo4UshExVSs9QexzF0T1ZzByonDhIkJQu7ygXe+EQQlQ3D
	IlNp9rmCg9bew1kr6stUd5TJsYa4NZ8fKmGA07AkH8/OxTUJALmg=
X-Received: by 2002:a05:620a:a1d6:20b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cb7bfe78eemr1160538285a.31.1771853861942;
        Mon, 23 Feb 2026 05:37:41 -0800 (PST)
X-Received: by 2002:a05:620a:a1d6:20b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cb7bfe78eemr1160534485a.31.1771853861406;
        Mon, 23 Feb 2026 05:37:41 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/9] soc: remove direct accesses to of_root from
 drivers/soc/
Date: Mon, 23 Feb 2026 14:37:15 +0100
Message-Id: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtYnGkC/22MQQ6CMBBFr0Jm7ZC2IgVX3sOwqLWVJsJoBxsN6
 d2trN385P3kvRXYxeAYjtUK0aXAgeYCaleBHc18cxiuhUEJ1Qope2SySB4j0YJa2661h0ZI4aE
 Yj+h8eG+181B4DLxQ/GzxJH/v/06SKHCvjPCmN7q7NCdirp8vc7c0TXUZGHLOX4FjjF2tAAAA
X-Change-ID: 20260119-soc-of-root-77c86c54010f
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8U1qrV9VPbA1NurePpOKrOc1y8Pp0LEFx1aO9DiJBzo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgVUenh9qw3oSpou3F8KSCFXav2bvcRiege3
 sGVJWni6mSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYFQAKCRAFnS7L/zaE
 w5uXD/9yJoDbzqFe8HN69sZX6yHCeFb24ey9/QRxDPVxBDUzo/mC1CmWvU9maHjuUi2DhsZqteY
 vVFK/mvqS21ADpPY9IZMhs9bAmGazA5FS6vLdUNPVB4LEkay288yM5di7NV8q+nibyZUd+hsN7V
 X16nMjmBSYZQcTGiOzDHPBzeSgdWvaMLE3VaEh/A9eFmK4duP55S2ax2luP0asf4iUjas6/ENcc
 kLL8b5IE8GN38bvLejihYDytXYJTc3u1PGWEeZF4cfzmOXpPEd07oJp0xSx8/+OLRylFE69VXH1
 8LAwgPhQSnLbfXneimOOuBt62w9ZnCRFc4hMTIju6Kt4wcigTjzSECjR4kbedSz7coD6p8e7bxj
 CzFz+qCGHaam/FvGnBRN8pDaB4hz0RbNofKeXNlBhJlVpAr0G3X+SYpxc0oHh5sRcSNu2stBssc
 FlqN7icTX1KQnCpSbzrB1rE+vXwxe0uBbzuSj7DaEzGdJmDJXx3ars6mFSunWmWbPUr8x3fsieX
 p/iTxe7StpSNuiucKFnJNzAaPYri1PyLu0BQA8gV5IIZ09OKvMPzXe4pLTe5iL9rZQPda+m7wuT
 rEx+R8qYrAT+W/In7OB3eZuTsNFHzTwavJjw1XOfN7LTRrKIPlvd8OxtwgVlbnz+AXam9TwfM8d
 qTt/p/Jo5DS26nw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX9uUI/l6SonC5
 l/xDk3FADJ5KUFEWoMx6cNQ8V8XWqJOWmHTAPxXTcBdcRFENYMy54KzmgOfMjSB+A/3vbqq2AGo
 R/zslq8etTMuK+v9PC4yysJTnhe6xDDE+An/Jj6igPVojj3a2dvTbvRx7mS+Rw2IN7cEpQw5h9K
 DBOdM2oQO3FPLqEx0BlIL/OVDxIRqqlbz9abPGDDPzyD5F4Z/yxYofFm8Cla5OthcsNBXr3SZ5b
 O14WEW7Be07wD406r6Q0njgNDvzGinARxpBDiaQKs0yIfUXc3bsD+fiGGxcS0j5b58lTWyOhg4+
 r1lbwNXEfADv5EN8B+qCIVbnjjm3ioIsEaJObiQTfUjtUAKEZaNPrL5pJIDte5Jmy91bjEIEH6S
 mJjGoPIPlUeptKnR7+RPIt1jm9i8S7mC0WJrJz0m0s2qnBiULWK+De+jSLEIbZG3RTNrhdNVT1t
 Xcb85f0g5IvIYx9zGhw==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c5826 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dWNf8gF45q0IjK5QRoUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8KtKQQITtgAxJLsa-RbN9dcYeAZ5bBmx
X-Proofpoint-ORIG-GUID: 8KtKQQITtgAxJLsa-RbN9dcYeAZ5bBmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117

linux/of.h declares a set of variables providing addresses of certain
key OF nodes. The pointers being variables can't profit from stubs
provided for when CONFIG_OF is disabled which means that drivers
accessing these variables can't profit from CONFIG_COMPILE_TEST=y
coverage.

There are drivers under drivers/soc/ that access the of_root node. This
series introduces new OF helpers for reading the machine compatible and
model strings, exports an existing SoC helper that reads the machine
string from the root node and finally replaces all direct accesses to
of_root with new or already existing helper functions.

Merging strategy: first two patches should be either acked by Rob or
picked up into an immutable branch based on v7.0-rc1, the rest can go
through the SoC tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- rename of_machine_get_compatible() to of_machine_read_compatible() and
  add the index argument
- add a stub for of_machine_read_compatible() for !CONFIG_OF
- provide of_machine_read_model() to avoid having to look-up the root
  node via of_find_node_by_path("/")
- rename soc_device_get_machine() to soc_attr_read_machine() before
  making it an exported symbol
- Link to v1: https://lore.kernel.org/r/20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com

---
Bartosz Golaszewski (9):
      of: provide of_machine_read_compatible()
      of: provide of_machine_read_model()
      base: soc: order includes alphabetically
      base: soc: rename and export soc_device_get_machine()
      soc: fsl: guts: don't access of_root directly
      soc: imx8m: don't access of_root directly
      soc: imx9: don't access of_root directly
      soc: renesas: don't access of_root directly
      soc: sunxi: mbus: don't access of_root directly

 drivers/base/soc.c                | 23 ++++++++++-------------
 drivers/of/base.c                 | 28 ++++++++++++++++++++++++++++
 drivers/soc/fsl/guts.c            | 12 +++---------
 drivers/soc/imx/soc-imx8m.c       | 11 +++--------
 drivers/soc/imx/soc-imx9.c        |  4 ++--
 drivers/soc/renesas/renesas-soc.c |  7 ++++++-
 drivers/soc/sunxi/sunxi_mbus.c    |  2 +-
 include/linux/of.h                | 14 ++++++++++++++
 include/linux/sys_soc.h           | 10 ++++++++++
 9 files changed, 77 insertions(+), 34 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260119-soc-of-root-77c86c54010f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

